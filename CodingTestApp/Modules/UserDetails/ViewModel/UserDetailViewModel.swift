//
//  UserDetailViewModel.swift
//  CodingTestApp
//
//  Created by Nilay on 25/08/23.
//

import Foundation

class UserDetailViewModel: ObservableObject {
    
    @Published var userDetail: UsersResponse?
    @Published var userPosts: [PostsResponse]?
    @Published var isLoading: Bool = false
    
    let apiService: APIServiceProtocol
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchPosts(String(userDetail?.id ?? 0)) { [weak self] (success, results, error) in
            DispatchQueue.main.async {
                self?.isLoading = false
                if error == nil{
                    self?.userPosts = results
                }
            }
        }
    }
}
