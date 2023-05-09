//
//  CustomerDetailsVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 01/05/23.
//

import UIKit

class CustomerDetailsVC: UIViewController {
    
    static let storyboardId = "CustomerDetailsVC"
    
    @IBOutlet weak var callsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
        callsTableView.register(UINib(nibName: String(describing: CustomerCallCell.self), bundle: nil), forCellReuseIdentifier: CustomerCallCell.cellIdentifier)
        callsTableView.delegate = self
        callsTableView.dataSource = self
    }
    
    private func createNewCall(){
        if let createNewCallVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CreateNewCallVC.storyboardId) as? CreateNewCallVC{
            navigationController?.pushViewController(createNewCallVC, animated: true)
        }
    }
    
    private func openCallDetails(){
        if let callDetailsVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CallDetailsVC.storyboardId) as? CallDetailsVC{
            navigationController?.pushViewController(callDetailsVC, animated: true)
        }
    }
    
    //MARK: IBACTIONS
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewCallBtnPressed(_ sender: UIButton) {
        createNewCall()
    }
    
   
}

//MARK: TABLEVIEW DELEGATE & DATASOURCE
extension CustomerDetailsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let callCell = tableView.dequeueReusableCell(withIdentifier: CustomerCallCell.cellIdentifier, for: indexPath) as? CustomerCallCell else {return UITableViewCell()}
        return callCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openCallDetails()
    }
    
    
}
