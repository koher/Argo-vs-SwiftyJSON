import Foundation
import Argo
import Curry

extension User: Decodable {
    static func decode(json: JSON) -> Decoded<User> {
        return curry(User.init)
            <^> json <| "id"
            <*> json <|? "nickname"
            <*> (json <| "age" >>- { $0 >= 0 ? pure($0)
                : .customError("age: Out of range (\($0))") })
            <*> (json <|? "admin").map { $0 ?? false }
    }
}
