//
//  UsersViewControllerTableViewController.swift
//  Messager
//
//  Created by Wang, Chongbei on 3/12/21.
//  Copyright © 2021 com.wchb. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    //MARK: - Vars
    var allUsers: [User] = []
    var filteredUsers: [User] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? filteredUsers.count : allUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
       
        let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]
        
        cell.configure(user: user)
       
        return cell
    }
    
}
