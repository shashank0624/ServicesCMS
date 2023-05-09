//
//  CustomerCell.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 04/05/23.
//

import UIKit

@objc protocol CustomerCellDelegate{
    @objc func editPressed(indexPath : IndexPath)
}

class CustomerCell: UITableViewCell {
    
    static let cellIdentifier = "customerCellId"
    
    weak var delegate : CustomerCellDelegate!
    var indexPath : IndexPath!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
        guard let delegate = delegate else {return}
        delegate.editPressed(indexPath: indexPath)
    }
    
}
