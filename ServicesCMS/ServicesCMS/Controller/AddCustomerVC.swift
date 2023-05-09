//
//  AddCustomerVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import UIKit

class AddCustomerVC: UIViewController {
    
    static let storyboardId = String(describing: AddCustomerVC.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
