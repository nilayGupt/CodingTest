//
//  UsersListViewController.swift
//  CodingTestApp
//
//  Created by deq on 25/08/23.
//

import UIKit
import SwiftUI

class UsersListViewController: UIViewController {
    @IBOutlet weak var userTableView : UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var viewModel: UsersViewModel = {
        return UsersViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Init the static view
        initView()
        
        // init view model
        initVM()
    }

    //Mark: Setup View Methods
    func initView() {
        userTableView.register(UINib(nibName: Cells.UsersTableViewCellId, bundle: nil), forCellReuseIdentifier: Cells.UsersTableViewCellId)
        userTableView.estimatedRowHeight = 140
        userTableView.rowHeight = UITableView.automaticDimension
    }
    
    func initVM() {
        
        // Naive binding
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( message )
                }
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.userTableView.alpha = 0.0
                    })
                }else {
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.userTableView.alpha = 1.0
                    })
                }
            }
        }
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.userTableView.reloadData()
            }
        }
        
        viewModel.initFetch()
        
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: Strings.alertTitle, message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

//MARK: TableView Delegate and DataSource
extension UsersListViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.UsersTableViewCellId , for: indexPath) as? UsersTableViewCell else {
            fatalError("Cell not exists")
        }
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        cell.userNameLabel.text = "Name- \(cellVM.titleText)"
        cell.userEmailLabel.text = "Email- \(cellVM.emailText)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     self.viewModel.userPressed(at: indexPath)
        let viewModel = UserDetailViewModel()
        viewModel.userDetail = self.viewModel.selectedUser
        let swiftUIViewController = UIHostingController(rootView: UserDetailView(viewModel: viewModel))
        
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)

    }

}
