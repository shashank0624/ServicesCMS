//
//  ViewController.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
    
    @IBAction func SignInBtnPressed(_ sender: UIButton) {
        if let dashboardVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: DashboardVC.storyboardId) as? DashboardVC{
            navigationController?.pushViewController(dashboardVC, animated: true)
        }
    }
    


}

