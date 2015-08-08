import XCTest
import SwiftyJSON
import Result
@testable import ArgoVsSwiftyJSON

private func jsonObject(jsonString: String) -> AnyObject {
    return try! NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions(rawValue: 0))
}

class SwiftyJSONTest: XCTestCase {
    func testFrom3() {
        if true {
            let user = User.from3(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            } else {
                XCTFail()
            }
        }
        
        if true {
            let user = User.from3(JSON(jsonObject("{\"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))

            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from3(JSON(jsonObject("{\"id\" : \"ffffffff\", \"age\" : 100, \"admin\" : true}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "ffffffff")
                XCTAssertTrue(u.nickname == nil)
                XCTAssertEqual(u.age, 100)
                XCTAssertEqual(u.admin, true)
            } else {
                XCTFail()
            }
        }
        
        if true {
            let user = User.from3(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : -1, \"admin\" : false}")))
            
            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from3(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"admin\" : false}")))
            
            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from3(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            } else {
                XCTFail()
            }
        }
    }
    
    func testFrom4() {
        if true {
            let user = User.from4(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            } else {
                XCTFail()
            }
        }
        
        if true {
            let user = User.from4(JSON(jsonObject("{\"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from4(JSON(jsonObject("{\"id\" : \"ffffffff\", \"age\" : 100, \"admin\" : true}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "ffffffff")
                XCTAssertTrue(u.nickname == nil)
                XCTAssertEqual(u.age, 100)
                XCTAssertEqual(u.admin, true)
            } else {
                XCTFail()
            }
        }
        
        if true {
            let user = User.from4(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : -1, \"admin\" : false}")))
            
            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from4(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"admin\" : false}")))
            
            XCTAssertTrue(user == nil)
        }
        
        if true {
            let user = User.from4(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30}")))
            
            if let u = user {
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            } else {
                XCTFail()
            }
        }
    }
    
    func testFrom5() {
        if true {
            let user = User.from5(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from5(JSON(jsonObject("{\"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "id")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from5(JSON(jsonObject("{\"id\" : \"ffffffff\", \"age\" : 100, \"admin\" : true}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "ffffffff")
                XCTAssertTrue(u.nickname == nil)
                XCTAssertEqual(u.age, 100)
                XCTAssertEqual(u.admin, true)
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from5(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : -1, \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "age")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from5(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "age")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from5(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            default:
                XCTFail()
            }
       }
    }
    
    func testFrom6() {
        if true {
            let user = User.from6(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from6(JSON(jsonObject("{\"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "id")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from6(JSON(jsonObject("{\"id\" : \"ffffffff\", \"age\" : 100, \"admin\" : true}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "ffffffff")
                XCTAssertTrue(u.nickname == nil)
                XCTAssertEqual(u.age, 100)
                XCTAssertEqual(u.admin, true)
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from6(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : -1, \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "age")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from6(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"admin\" : false}")))
            
            switch user {
            case .Failure(.Unparsable(let message)):
                XCTAssertEqual(message, "age")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user = User.from6(JSON(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30}")))
            
            switch user {
            case .Success(let u):
                XCTAssertEqual(u.id, "a082b4fe")
                XCTAssertTrue(u.nickname == "Foo")
                XCTAssertEqual(u.age, 30)
                XCTAssertEqual(u.admin, false)
            default:
                XCTFail()
            }
        }
    }
}