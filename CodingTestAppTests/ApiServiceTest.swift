//
//  ApiServiceTest.swift
//  CodingTestAppTests
//
//  Created by Nilay on 25/08/23.
//

import XCTest
@testable import CodingTestApp

class APIServiceTests: XCTestCase {
    
    var sut: APIService?
    
    override func setUp() {
        super.setUp()
        sut = APIService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_top_stories() {
        
        // Given A apiservice
        let sut = self.sut!
        
        // When fetch top stories
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchUsers(complete: { (success, users, error) in
            expect.fulfill()
            for user in users {
                XCTAssertNotNil(user)
            }
            
        })
        
        wait(for: [expect], timeout: 3.1)
    }
    
}
