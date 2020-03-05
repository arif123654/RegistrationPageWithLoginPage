//
//  RegViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegViewController: UIViewController {
    
    
    
    //MARK:- Utilities
    @IBOutlet weak var firatNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var lastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var mobileTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var genderTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var locationTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var districtTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpButton.layer.cornerRadius = 7
        // Do any additional setup after loading the view.
    }
    


    
    
    //MARK:- Sign Up
    @IBAction func signUpButton(_ sender: Any) {
        if confirmPasswordTextField.text! == passwordTextField.text!{
            postdata()
        } else {
            confirmPasswordTextField.errorMessage = "Password Doesn't match"
        }
    }
    
    
    //MARK:- POST methode function
    func postdata(){
        let parameters = ["FirstName": firatNameTextField.text!,"LastName":lastNameTextField.text!,"mobile":mobileTextField.text!,"email":emailTextField.text!,"gender":genderTextField.text!,"district":districtTextField.text!,"location":locationTextField.text!, "password": passwordTextField.text!] as [String : Any]
            //let parameters = ["mobile":"01742011644", "password": "123456"] as [String : Any]

            //create the url with URL
            let url = URL(string: "http://192.168.0.30/bdweather/API/registration.php")! //change the url

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
                        // handle json...
                    }
                } catch let error {
                   
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
}
