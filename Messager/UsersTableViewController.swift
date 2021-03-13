import UIKit

class UsersTableViewController: UITableViewController {
    
    //MARK: - Vars
    var allUsers: [User] = []
    var filteredUsers: [User] = []
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        //createDummyUsers()
    }

    // MARK: UICollectionViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredUsers.count : allUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell

        let user = searchController.isActive ? filteredUsers[indexPath.row] : allUsers[indexPath.row]

        cell.configure(user: user)

        return cell
    }
 

}
