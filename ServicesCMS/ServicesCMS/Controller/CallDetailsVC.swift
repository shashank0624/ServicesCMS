//
//  CallDetailsVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 03/05/23.
//

import UIKit

class CallDetailsVC: UIViewController {
    
    static let storyboardId = "CallDetailsVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func createNewCall(){
        if let createNewCallVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CreateNewCallVC.storyboardId) as? CreateNewCallVC{
            navigationController?.pushViewController(createNewCallVC, animated: true)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editCallBtnPressed(_ sender: UIButton) {
        createNewCall()
    }
}
