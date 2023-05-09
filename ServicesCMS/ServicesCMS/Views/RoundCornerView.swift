//
//  RoundCornerView.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 29/04/23.
//

import UIKit

class RoundCornerView: UIView {

    private var radius : CGFloat = 0
    private var borderWidth : CGFloat = 0
    private var color : UIColor = .clear
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    func createRoundCorner(radius : CGFloat = 10.0, borderWidth : CGFloat = 1.0, color : UIColor = ThemeColor.Light.strokeColor){
        self.radius = radius
        self.borderWidth = borderWidth
        self.color = color
        updateView()
    }
    
    func createCapsuleCorner(color : UIColor = ThemeColor.Light.strokeColor){
        self.radius = frame.height / 2
        createRoundCorner(radius : self.radius, color: color)
    }
    
    func updateView(){
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }

    
    
    
    

}
