//
//  ScrollViewViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController {
    
    @IBOutlet weak var listImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    
    
    var img:UIImage?
    var name = ""
    var color = ""
    
    @IBOutlet weak var showDataButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDataButton.layer.cornerRadius = 7
        self.listImageView.image = img
        self.nameLabel.text = name
        self.colorLabel.text = color
        
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
    
    @IBAction func showData(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "ShowDataViewController") as! ShowDataViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    

}
