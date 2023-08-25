//
//  UsersViewModel.swift
//  CodingTestApp
//
//  Created by deq on 25/08/23.
//

import Foundation
class UsersViewModel {
    
    let apiService: APIServiceProtocol
    
    private var users: [UsersResponse] = [UsersResponse]()
    
    private var cellViewModels: [UserListCellViewModel] = [UserListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    
    var selectedUser: UsersResponse?
    
    typealias listner = ()->()
    var reloadTableViewClosure: (listner)?
    var showAlertClosure: (listner)?
    var updateLoadingStatus: (listner)?
    
    
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchUsers { [weak self] (success, results, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.localizedDescription
            } else {
                
                print(results);
                
                self?.processFetchedUsers(users: results)
            }
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> UserListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( users: UsersResponse ) -> UserListCellViewModel {
        return UserListCellViewModel(titleText: users.name ?? "", emailText: users.email ?? "")
    }
    
    private func processFetchedUsers( users: [UsersResponse] ) {
        self.users = users // Cache
        var vms = [UserListCellViewModel]()
        for user in users {
            vms.append( createCellViewModel(users: user) )
        }
        self.cellViewModels = vms
    }
    
}

extension UsersViewModel {
    func userPressed( at indexPath: IndexPath ){
        self.selectedUser = self.users[indexPath.row]
    }
}

struct UserListCellViewModel {
    let titleText: String
    let emailText: String
}

//struct UserDetailViewModel {
//    let userResponse : UsersResponse?
//}
