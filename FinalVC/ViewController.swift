//
//  ViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var mobileTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loginButton.layer.cornerRadius = 7
        self.signUpButton.layer.cornerRadius = 7
    }

    func landingPage(){
        let vc = storyboard?.instantiateViewController(identifier: "ShowTableButtonViewController") as! ShowTableButtonViewController
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
       
        
        if mobileTextField.text == nil{
            mobileTextField.errorMessage = "Enter Your Mobile No"
        } else if passwordTextField.text == nil {
            passwordTextField.errorMessage = "Enter Your Password"
        } //else if
        postdata()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "RegViewController") as! RegViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    //MARK:- POST methode function
    func postdata(){
        let parameters = ["mobile":mobileTextField.text!,"password":passwordTextField.text!] as [String:Any]
            //let parameters = ["mobile":"01742011644", "password": "123456"] as [String : Any]

            //create the url with URL
            let url = URL(string: "http://192.168.0.30/bdweather/API/login.php")! //change the url

            //create the session object
            let session = URLSession.shared

            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            request.httpMethod = "POST" //set http method as POST

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                guard error == nil else {   return  }

                guard let data = data else {    return  }

                do {
                    print(data)
                  
                    
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        DispatchQueue.main.async {
                            self.landingPage()
                        }
                        // handle json...
                    }
                } catch let error {
                   
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    
  
    
}

