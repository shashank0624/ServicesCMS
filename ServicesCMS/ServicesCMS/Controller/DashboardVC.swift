//
//  DashboardVC.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import UIKit

class DashboardVC: UIViewController {
    
    static let storyboardId = "DashboardVC"
    @IBOutlet weak var amountReceivedView: RoundCornerView!
    
    @IBOutlet weak var PendingAmountView: RoundCornerView!
    @IBOutlet weak var monthsCollectionView: UICollectionView!
    @IBOutlet weak var callsTableView: UITableView!
    @IBOutlet weak var callsSelectionView: RoundCornerView!
    
    @IBOutlet weak var openBtn: CustomAppButton!
    @IBOutlet weak var assignedBtn: CustomAppButton!
    @IBOutlet weak var closedBtn: CustomAppButton!
    
    
    var statusBtnsArray = [CustomAppButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupCollectionView()
    }
    
    private func setupUI(){
        amountReceivedView.createRoundCorner()
        PendingAmountView.createRoundCorner()
        callsSelectionView.createRoundCorner()
        openBtn.titleString = "Open"
        openBtn.subtitleString = "0"
        openBtn.setupButton(for: .filledBtn)
        
        assignedBtn.titleString = "Assigned"
        assignedBtn.subtitleString = "0"
        assignedBtn.setupButton(for: .filledBtn)
        
        closedBtn.titleString = "Closed"
        closedBtn.subtitleString = "0"
        closedBtn.setupButton(for: .filledBtn)
        
        statusBtnsArray = [openBtn,assignedBtn,closedBtn]
    }
    
    private func setupTableView(){
        callsTableView.register(UINib(nibName: String(describing: CallCell.self), bundle: nil), forCellReuseIdentifier: CallCell.cellId)
        callsTableView.delegate = self
        callsTableView.dataSource = self
    }
    
    private func setupCollectionView(){
        monthsCollectionView.register(UINib(nibName: String(describing: MonthsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: MonthsCollectionViewCell.cellIdentifier)
        monthsCollectionView.delegate = self
        monthsCollectionView.dataSource = self
//        monthsCollectionView.allowsMultipleSelection = false
    }
    
    
    private func openCallDetails(){
        if let callDetailsVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CallDetailsVC.storyboardId) as? CallDetailsVC{
            navigationController?.pushViewController(callDetailsVC, animated: true)
        }
    }
    
    //MARK: IBACTIONS
    
    @IBAction func statusBtnPressed(_ sender: CustomAppButton) {
        if !sender.isSelected{
            statusBtnsArray = statusBtnsArray.map({ button in
                button.isSelected = false
                return button
            })
            sender.isSelected.toggle()
            switch sender{
            case openBtn:
                print("Open Btn Pressed")
            case assignedBtn:
                print("Assigned Btn Pressed")
            case closedBtn:
                print("Closed Btn Pressed")
            default:
                print("default")
            }
        }
    }
    
    
    @IBAction func searchCustomerBtnPressed(_ sender: UIButton) {
        if let customersVC = StoryBoards.getStoryboard(for: StoryBoards.mainStoryboardId).instantiateViewController(withIdentifier: CustomersVC.storyboardId) as? CustomersVC{
            navigationController?.pushViewController(customersVC, animated: true)
        }
    }

    @IBAction func logutBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}

//MARK: MONTHS COLLECTION VIEW
extension DashboardVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let monthCell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthsCollectionViewCell.cellIdentifier, for: indexPath) as? MonthsCollectionViewCell else {return UICollectionViewCell()}
        return monthCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //TODO: DESELECT CELL
    }
}

//MARK: CALLS TABLE VIEW
extension DashboardVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let callCell = tableView.dequeueReusableCell(withIdentifier: CallCell.cellId, for: indexPath) as? CallCell{
            callCell.updateData = ""
            return callCell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openCallDetails()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    
}
