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
        configureTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        showUserInfo()

    }

     
    //MARK: - TableView Delegates
    override func  tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableviewBackgroundColor")
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 0.0 : 30.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //TODO: show status view
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
    
    //MARK: - Configure
    private func configureTextField() {
        usernameTextField.delegate = self
        //usernameTextField.clearButtonMode = .whileEditing
    }
}

extension EditProfileTableViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            if textField.text != "" {
                if var user = User.currentUser {
                    user.userName = textField.text!
                    saveUserLocally(user)
                    FirebaseUserListener.shared.saveUserToFirestore(user)
                }
            }
            
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}
