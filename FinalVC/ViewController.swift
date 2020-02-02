//
//  ViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginButton.layer.cornerRadius = 7
        self.signUpButton.layer.cornerRadius = 7
    }

    @IBAction func loginButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ShowTableButtonViewController") as! ShowTableButtonViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "RegViewController") as! RegViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

