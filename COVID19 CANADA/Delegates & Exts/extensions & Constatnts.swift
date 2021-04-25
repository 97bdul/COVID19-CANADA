//
//  extensions.swift
//  Covid19 in CA
//
//  Created by Abdul R on 2021-03-30.
//

import Foundation
import UIKit


//dropShadow
extension UIView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat, color: UIColor){
        
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = color.cgColor
        containerView.layer.shadowOpacity = 7
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 4
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}

//label extensions
extension UILabel{
    func propLabel(fontSize:CGFloat, fontWeight: UIFont.Weight, textColor: UIColor, textAlignment: NSTextAlignment, Backgroundcolor: UIColor, cornerRadius:CGFloat, borderWidth: CGFloat, borderColor: UIColor){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .rounded(ofSize: fontSize, weight: fontWeight)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = borderColor
        self.layer.borderWidth = borderWidth
        self.textColor = textColor
        self.backgroundColor = Backgroundcolor
        self.textAlignment = textAlignment
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        
        guard #available(iOS 13.0, *), let descriptor = systemFont.fontDescriptor.withDesign(.rounded) else { return systemFont }
        return UIFont(descriptor: descriptor, size: size)
    }
}

extension UIView{

    func gradientbg(view:UIView, color1:UIColor, color2:UIColor, x:Double, y:Double){
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: x, y: y)
        view.layer.addSublayer(gradient)
    }
}

