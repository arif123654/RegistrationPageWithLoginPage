//
//  RegViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpButton.layer.cornerRadius = 7
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ShowTableButtonViewController") as! ShowTableButtonViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
