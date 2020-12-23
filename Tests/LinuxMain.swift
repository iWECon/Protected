import XCTest

import ProtectedTests

var tests = [XCTestCaseEntry]()
tests += ProtectedTests.allTests()
XCTMain(tests)
