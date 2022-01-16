//
//  MainTableViewController.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var total = Total.getTotal()

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkingManager.shared.fetchTotalObjects(url: Link.totalApi.rawValue) { total in
            self.total = total
            self.title = " В MetMuseum \(self.total.total) экспонатов"
            self.tableView.reloadData()
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        total.objectIDs.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = "objectID: \(total.objectIDs[indexPath.row])"
       
        cell.contentConfiguration = content
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
