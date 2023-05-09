//
//  CreateNewCallVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 01/05/23.
//

import UIKit

class CreateNewCallVC: UIViewController {
    
    static let storyboardId = "CreateNewCallVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
