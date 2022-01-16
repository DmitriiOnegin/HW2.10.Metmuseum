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
}
