import XCTest
@testable import Protected

final class ProtectedTests: XCTestCase {
    
    @Protected var historyAvatarUrlStrings: [String] = []
    @Protected var balance: Int64 = 0
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        $historyAvatarUrlStrings.append("new url string of avatar")
        
        $balance.write { v in
            v = 10
        }
        
        let currentBalance = $balance.read { $0 }
        // or
        // $balance.value
        print(currentBalance)
        
        let tmp = $historyAvatarUrlStrings.read { $0 }
        print(tmp)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
