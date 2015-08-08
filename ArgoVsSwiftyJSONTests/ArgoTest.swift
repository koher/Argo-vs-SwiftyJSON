import XCTest
import Argo
@testable import ArgoVsSwiftyJSON

private func jsonObject(jsonString: String) -> AnyObject {
    return try! NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions(rawValue: 0))
}

class ArgoTest: XCTestCase {
    func testDecode() {
        if true {
            let user: Decoded<User> = decode(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}"))
            
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
            let user: Decoded<User> = decode(jsonObject("{\"nickname\" : \"Foo\", \"age\" : 30, \"admin\" : false}"))

            switch user {
            case .MissingKey(let message):
                XCTAssertEqual(message, "id")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user: Decoded<User> = decode(jsonObject("{\"id\" : \"ffffffff\", \"age\" : 100, \"admin\" : true}"))
            
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
            let user: Decoded<User> = decode(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : -1, \"admin\" : false}"))

            switch user {
            case .TypeMismatch(let message):
                XCTAssertEqual(message, "age: Out of range (-1)")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user: Decoded<User> = decode(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"admin\" : false}"))
            
            switch user {
            case .MissingKey(let message):
                XCTAssertEqual(message, "age")
            default:
                XCTFail()
            }
        }
        
        if true {
            let user: Decoded<User> = decode(jsonObject("{\"id\" : \"a082b4fe\", \"nickname\" : \"Foo\", \"age\" : 30}"))

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
