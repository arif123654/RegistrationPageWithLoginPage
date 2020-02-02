//
//  ListViewController.swift
//  FinalVC
//
//  Created by apple on 2/2/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    
    
    var name = ["Lion","Panda","Tiger","Wolf","Raccondog"]
    var color = ["Cream","Black & White","White","Light Gray","Dark Gray"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
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

}


extension ListViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
//        cell.accessoryType = .disclosureIndicator
        cell.listImageView.image = UIImage(named: name[indexPath.row])
        cell.nameLabel.text = name[indexPath.row]
        cell.colorLabel.text = color[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 325
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ScrollViewViewController") as! ScrollViewViewController
        
        vc.img = UIImage(named: name[indexPath.row])
        vc.name = name[indexPath.row]
        vc.color = color[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
