//
//  MonthsCollectionViewCell.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 04/05/23.
//

import UIKit

class MonthsCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "monthsColCellId"
    
    
    @IBOutlet weak var mainBgView: RoundCornerView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                mainBgView.backgroundColor = ThemeColor.Light.textField
                mainBgView.createCapsuleCorner(color : ThemeColor.Light.strokeColor)
                titleLbl.textColor = ThemeColor.Light.strokeColor
            }else{
                mainBgView.backgroundColor = ThemeColor.Light.btnColor
                mainBgView.createCapsuleCorner(color : ThemeColor.Light.textField)
                titleLbl.textColor = ThemeColor.Light.textField
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        mainBgView.createCapsuleCorner()
        
    }
    
    override func draw(_ rect: CGRect) {
        mainBgView.createCapsuleCorner()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    

}
