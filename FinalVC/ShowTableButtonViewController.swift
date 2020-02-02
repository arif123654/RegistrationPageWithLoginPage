//
//  ShowTableButtonViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ShowTableButtonViewController: UIViewController {

    @IBOutlet weak var showTableViewButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showTableViewButton.layer.cornerRadius = 7
    }
    

    @IBAction func shoeTableViewButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ListViewController") as! ListViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
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
