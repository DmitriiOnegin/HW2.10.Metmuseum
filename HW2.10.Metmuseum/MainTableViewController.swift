//
//  MainTableViewController.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var total: Total!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " В MetMuseum \(self.total.total) экспонатов"
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


    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let obgectVC = segue.destination as? ObjectViewController else { return }
//                guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        obgectVC.objectID = total.objectIDs[indexPath.row]
//        
//    }
   

}
