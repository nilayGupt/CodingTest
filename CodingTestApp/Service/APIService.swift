//
//  APIService.swift
//  CodingTestApp
//
//  Created by deq on 25/08/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchUsers( complete: @escaping ( _ success: Bool, _ topStories: [UsersResponse], _ error: Error? )->() )
    func fetchPosts(_ userId : String, complete: @escaping ( _ success: Bool, _ topStories: [PostsResponse], _ error: Error? )->() )

    
}
class UrlComponents {
    let path: String
    let baseUrlString = "https://jsonplaceholder.typicode.com/"
    
    
    var url: URL? {
         let finalUrl =  URL(string: (baseUrlString + path))
            return finalUrl
    }
    
    init(path: String) {
        self.path = path
    }
}

private let sessionManager: URLSession = {
    let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
}()

class APIService: APIServiceProtocol {
    
    // Simulate a long waiting for fetching
    func fetchUsers( complete: @escaping ( _ success: Bool, _ results: [UsersResponse], _ error: Error? )->() ) {
        
        let urlComponents = UrlComponents(path: "users")
        let request = URLRequest(url: urlComponents.url!)
        
        sessionManager.dataTask(with: request) { (data, _, error) in
            
            //Handle error case
            guard error == nil else {
                complete( false,[], error )
                return
            }
            do{
                let response = try JSONDecoder().decode([UsersResponse].self, from: data!)
                    complete( true, (response), nil )
            }catch let err{
                print(err)
            }
                      
            }.resume()

    }
    
    func fetchPosts(_ userId : String,complete: @escaping (Bool, [PostsResponse], Error?) -> ()) {
        
        let urlComponents = UrlComponents(path: "posts?userId=\(userId )")
        let request = URLRequest(url: urlComponents.url!)
        
        sessionManager.dataTask(with: request) { (data, _, error) in
            
            //Handle error case
            guard error == nil else {
                complete( false,[], error )
                return
            }
            do{
                let response = try JSONDecoder().decode([PostsResponse].self, from: data!)
                    complete( true, (response), nil )
            }catch let err{
                print(err)
            }
                      
            }.resume()

    }
    
}







