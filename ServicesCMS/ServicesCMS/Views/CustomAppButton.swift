//
//  RoundBorderButton.swift
//  ServicesCMS
//
//  Created by Shashank Panwar on 06/05/23.
//

import UIKit


enum CustomButtonTypes{
    case filledBtn
    case tintedBtn
}

class CustomAppButton: UIButton {

    var titleString : String?{
        didSet{
            
            let titleString = AttributedString(titleString ?? "",
                                               attributes: AttributeContainer(
                                                [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 14)!]
                                               )
            )
            configuration?.attributedTitle = titleString
        }
    }
    
    var subtitleString : String?{
        didSet{
            
            let titleString = AttributedString(titleString ?? "",
                                               attributes: AttributeContainer(
                                                [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 14)!]
                                               )
            )
            configuration?.subtitle = "2"
            configuration?.titleAlignment = .center
        }
    }
    
  
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func setupButton(for type : CustomButtonTypes){
        switch type {
        case .filledBtn:
            setUpFilledBtn()
        case .tintedBtn:
            setUpTintedBtn()
        }
    }
    
    private func setUpFilledBtn(){
        configurationUpdateHandler = { button in
            switch button.state {
            case .normal:
                self.configuration?.cornerStyle = .capsule
                self.configuration?.background.strokeWidth = 1.0
                self.configuration?.baseBackgroundColor = ThemeColor.Light.btnColor
                self.configuration?.baseForegroundColor = ThemeColor.Light.textField
                self.configuration?.background.strokeColor = ThemeColor.Light.textField
            case .selected:
                self.configuration?.cornerStyle = .capsule
                self.configuration?.background.strokeWidth = 1.0
                self.configuration?.baseBackgroundColor = UIColor.clear
                self.configuration?.baseForegroundColor = ThemeColor.Light.btnColor
                self.configuration?.background.strokeColor = ThemeColor.Light.btnColor
            default:
                break
            }
        }
    }
    
    private func setUpTintedBtn(){
        configuration?.cornerStyle = .capsule
        configuration?.background.strokeWidth = 1.0
        configuration?.baseBackgroundColor = UIColor.clear
        configuration?.baseForegroundColor = ThemeColor.Light.textColor
        configuration?.background.strokeColor = ThemeColor.Light.strokeColor
    }
    

}
