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
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let mainVC = navigationVC.topViewController as! MainTableViewController
        mainVC.total = total
    }
    
    
    @IBAction func loadButton() {
        NetworkingManager.shared.fetchTotalObjects(url: Link.totalApi.rawValue) { total in
            self.total = total
            self.loadingLabel.stopAnimating()
            self.loadingLabel.isHidden = true
            self.performSegue(withIdentifier: "mainSigvey", sender: nil)
        }
        loadingLabel.isHidden = false
        loadingLabel.startAnimating()
        buttonLabel.isHidden = true
      //  performSegue(withIdentifier: "mainSigvey", sender: nil)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
