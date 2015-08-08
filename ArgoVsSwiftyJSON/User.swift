struct User {
    let id: String
    let nickname: String?
    let age: Int
    let admin: Bool
}

extension User: CustomStringConvertible {
    var description: String {
        return "User(id: \(id), nickname: \(nickname), age: \(age), admin: \(admin))"
    }
}