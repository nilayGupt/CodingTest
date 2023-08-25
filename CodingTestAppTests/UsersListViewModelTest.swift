//
//  UsersListViewModelTest.swift
//  CodingTestAppTests
//
//  Created by Nilay on 25/08/23.
//

import XCTest

import XCTest
@testable import CodingTestApp

class UsersListViewModelTest: XCTestCase {
    var sut: UsersViewModel!
    var mockAPIService: MockApiService!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockAPIService = MockApiService()
        sut = UsersViewModel(apiService: mockAPIService)
    }
    
   
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    
  
    
    
    func test_fetch_topStories() {
        // Given
        mockAPIService.completeUserResponse = [UsersResponse]()
        mockAPIService.completePostsResponse = [PostsResponse]()

        // When
        sut.initFetch()
        
        // Assert
        XCTAssert(mockAPIService!.isFetchUsersCalled)
        
    }
    
    func test_fetch_topStories_fail() {
        
//        //Create an instance of Api error for mocking the fetch fail
//        let error

        // When
        sut.initFetch()

        //Replace the nil with error instace
        mockAPIService.fetchFail(error: nil )

        // Sut should display predefined error message
        XCTAssertEqual( sut.alertMessage, nil)
        
    }
   
    
    func test_get_cell_view_model() {
        
        //Given a sut with fetched topstories
        goToFetchTopStoriesFinished()
        
        let indexPath = IndexPath(row: 1, section: 0)
        let testStory = mockAPIService.completeUserResponse[indexPath.row]
        
        // When
        let vm = sut.getCellViewModel(at: indexPath)
        
        //Assert
        XCTAssertEqual( vm.titleText, testStory.name ?? "")
        XCTAssertEqual( vm.emailText, testStory.email ?? "")

    }
   
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


//MARK: State control
extension UsersListViewModelTest {
    private func goToFetchTopStoriesFinished() {
        mockAPIService.completeUserResponse = StubGenerator().stubTopStories()
        sut.initFetch()
        mockAPIService.fetchSuccess()
    }
}


class MockApiService: APIServiceProtocol {
    var isFetchUsersCalled = false
    var isFetchPostsCalled = false
    var completeUserResponse: [UsersResponse] = [UsersResponse]()
    var completePostsResponse: [PostsResponse] = [PostsResponse]()

    var completeClosure: ((Bool, [UsersResponse], Error?) -> ())!
    var completePostClosure: ((Bool, [PostsResponse], Error?) -> ())!
    
    
    func fetchUsers(complete: @escaping (Bool, [UsersResponse], Error?) -> ()) {
        isFetchUsersCalled = true
        completeClosure = complete
        
    }
    func fetchPosts(_ userId: String, complete: @escaping (Bool, [PostsResponse], Error?) -> ()) {
        isFetchPostsCalled = true
        completePostClosure = complete
        
    }

    func fetchSuccess() {
        completeClosure( true, completeUserResponse, nil )
    }
    
    func fetchFail(error: Error?) {
        completeClosure( false, completeUserResponse, error )
    }
    
}

class StubGenerator {
    func stubTopStories() -> [UsersResponse] {
        let path = Bundle.main.path(forResource: "content", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let users = try? decoder.decode([UsersResponse].self, from: data)
        return users ?? []
    }
}
