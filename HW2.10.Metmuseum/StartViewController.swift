//
//  StartViewController.swift
//  HW2.10.Metmuseum
//
//  Created by Dmitrii Onegin on 16.01.2022.
//

import UIKit

class StartViewController: UIViewController {

    var total = Total.getTotal()
    
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var loadingLabel: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let mainVC = navigationVC.topViewController as! MainTableViewController
        mainVC.total = total
    }
    
    @IBAction func loadButton() {
        if total.total == Total.getTotal().total {
        NetworkingManager.shared.fetchTotalObjects(url: Link.totalApi.rawValue) { total in
            self.total = total
            self.loadingLabel.stopAnimating()
            self.loadingLabel.isHidden = true
            self.buttonLabel.setTitle("Посмотреть список объектов", for: .normal)
            self.buttonLabel.isHidden = false
            self.performSegue(withIdentifier: "mainSigvey", sender: nil)
        }
        loadingLabel.isHidden = false
        loadingLabel.startAnimating()
        buttonLabel.isHidden = true
        } else {
            performSegue(withIdentifier: "mainSigvey", sender: nil)
        }
    }
}
