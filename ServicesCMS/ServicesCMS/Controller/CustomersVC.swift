//
//  CustomersVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import UIKit

class CustomersVC: UIViewController {
    
    static let storyboardId = String(describing: CustomersVC.self)
    
    @IBOutlet weak var customersTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    
    private func setUpTableView(){
        customersTableView.register(UINib(nibName: String(describing: CustomerCell.self), bundle: nil), forCellReuseIdentifier: CustomerCell.cellIdentifier)
        customersTableView.dataSource = self
        customersTableView.delegate = self
    }
    

    
    private func addNewCustomer(){
        if let addCustomerVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: AddCustomerVC.storyboardId) as? AddCustomerVC{
            navigationController?.pushViewController(addCustomerVC, animated: true)
        }
    }
    
    private func openCustomerDetails(){
        if let customerDetailsVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CustomerDetailsVC.storyboardId) as? CustomerDetailsVC{
            navigationController?.pushViewController(customerDetailsVC, animated: true)
        }
    }
    
    //MARK: IBACTIONS
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewCustomer(_ sender: UIButton) {
        addNewCustomer()
        
    }
    
}

extension CustomersVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customerCell = tableView.dequeueReusableCell(withIdentifier: CustomerCell.cellIdentifier, for: indexPath) as? CustomerCell else {return UITableViewCell()}
        customerCell.delegate = self
        customerCell.indexPath = indexPath
        return customerCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openCustomerDetails()
    }
}

extension CustomersVC : CustomerCellDelegate{
    func editPressed(indexPath : IndexPath) {
        addNewCustomer()
        print("Edit Pressed for \(indexPath.row)")
    }
    
}
