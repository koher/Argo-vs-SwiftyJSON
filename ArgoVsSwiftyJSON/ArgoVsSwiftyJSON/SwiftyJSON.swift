import Foundation
import SwiftyJSON
import Result
import Curry
import Runes

extension User {
    static func from1(json: JSON) -> User? {
        guard let id = json["id"].string else {
            return nil
        }
        
        let nickname = json["nickname"].string
        
        guard let age = json["age"].int else {
            return nil
        }
        
        guard let admin = json["admin"].bool else {
            return nil
        }
        
        return self.init(id: id, nickname: nickname, age: age, admin: admin)
    }
    
    static func from2(json: JSON) -> User? {
        return curry(User.init)
            <^> json["id"].string
            <*> .Some(json["nickname"].string)
            <*> json["age"].int
            <*> json["admin"].bool
    }
    
    static func from3(json: JSON) -> User? {
        guard let id = json["id"].string else {
            return nil
        }
        
        let nickname = json["nickname"].string
        
        guard let age = json["age"].int where age >= 0 else {
            return nil
        }
        
        let admin = json["admin"].bool ?? false
        
        return self.init(id: id, nickname: nickname, age: age, admin: admin)
    }
    
    static func from4(json: JSON) -> User? {
        return curry(User.init)
            <^> json["id"].string
            <*> .Some(json["nickname"].string)
            <*> (json["age"].int >>- { $0 >= 0 ? $0 : nil })
            <*> (json["admin"].bool ?? false)
    }
    
    static func from5(json: JSON) -> Result<User, ParseError> {
        guard let id = json["id"].string else {
            return .Failure(.Unparsable("id"))
        }
        
        let nickname = json["nickname"].string
        
        guard let age = json["age"].int where age >= 0 else {
            return .Failure(.Unparsable("age"))
        }
        
        let admin = json["admin"].bool ?? false
        
        return .Success(self.init(id: id, nickname: nickname, age: age, admin: admin))
    }
    
    static func from6(json: JSON) -> Result<User, ParseError> {
        return curry(User.init)
            <^> json["id"].string
                .map { .Success($0) } ?? .Failure(.Unparsable("id"))
            <*> .Success(json["nickname"].string)
            <*> (json["age"].int >>- { $0 >= 0 ? $0 : nil })
                .map { .Success($0) } ?? .Failure(.Unparsable("age"))
            <*> .Success(json["admin"].bool ?? false )
    }
}

enum ParseError: ErrorType {
    case Unparsable(String)
}

func <^><T, E: ErrorType, U>(lhs: T -> U, rhs: Result<T, E>) -> Result<U, E> {
    return rhs.map(lhs)
}

func <*><T, E: ErrorType, U>(lhs: Result<T -> U, E>, rhs: Result<T, E>) -> Result<U, E> {
    return lhs.flatMap { rhs.map($0) }
}