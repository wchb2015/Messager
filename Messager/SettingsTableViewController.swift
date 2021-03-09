//
//  SettingsTableViewController.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/3/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var appVersionLabel: UILabel!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        showUserInfo()
    }
    
    //MARK: - TableView Delegates
    override func  tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "tableviewBackgroundColor")
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.0 : 10.0
    }

    //MARK: - IB Actions
    
    @IBAction func tellFriendButtonPressed(_ sender: Any) {
        print("tellFriendButtonPressed")
    }
    
  
    @IBAction func termAndConditionsPressed(_ sender: Any) {
        print("termAndConditionsPressed")
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
          
        FirebaseUserListener.shared.logoutCurrentUser {
            (error) in
            
            if error == nil {
                let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "loginView")
                
                DispatchQueue.main.async {
                    loginView.modalPresentationStyle = .fullScreen
                    
                    self.present(loginView, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    //MARK: - UpdateUI
    private func showUserInfo(){
        if let user = User.currentUser {
            usernameLabel.text = user.userName
            statusLabel.text = user.status
            
            appVersionLabel.text = "App Verson \(Bundle.main.infoDictionary?["CFBundleShortVersionString"]as? String ?? "")"
            
            if user.avatarLink != "" {
                //download and set avatar image
            }
        }
    }
}
