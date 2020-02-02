//
//  ShowDataViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class ShowDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
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
    
    
    func fetchData(){
        Alamofire.request("https://jsonplaceholder.typicode.com/comments").responseJSON
            {
            response in
                if let json = response.result.value{
                    print("JSON: \(json)")
                }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
