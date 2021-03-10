//
//  EditProfileTableViewController.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/9/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import UIKit

class EditProfileTableViewController: UITableViewController {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        showUserInfo()
    }

     
    //MARK: - TableView Delegates
    override func  tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableviewBackgroundColor")
        
        return headerView
    }
    
    //MARK: Update UI
    func showUserInfo()  {
        
        if let user = User.currentUser {
            usernameTextField.text = user.userName
            statusLabel.text = user.status
            print(user)
            if user.avatarLink != "" {
                // set avatar
            }
        }
            
    }
}
