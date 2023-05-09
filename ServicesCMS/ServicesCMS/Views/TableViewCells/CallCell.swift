//
//  CallCell.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 03/05/23.
//

import UIKit

class CallCell: UITableViewCell {
    static let cellId = "CallCellId"
    
    @IBOutlet weak var statusBtn: CustomAppButton!
    @IBOutlet weak var mainBgView: RoundCornerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        statusBtn.setupButton(for: .tintedBtn)
        
        mainBgView.backgroundColor = ThemeColor.Light.textField
        mainBgView.createRoundCorner()
    }

    var updateData : String?{
        didSet{
            self.statusBtn.titleString = "Open"
        }
    }
    
}
