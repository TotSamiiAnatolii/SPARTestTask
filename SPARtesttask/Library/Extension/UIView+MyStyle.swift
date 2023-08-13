//
//  UIView+.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

extension UIView {
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
    
    public func setStyle() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        return self
    }
    
    
    public func setColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    public func setRoundCorners(radius: CGFloat) -> Self {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        return self
    }
    
    public func setShadows(color: CGColor, width: CGFloat, height: CGFloat, radius: CGFloat, opacity: Float ) -> Self {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
        return self
    }
    
    public func setShadow(color: CGColor, width: CGFloat, height: CGFloat, radius: CGFloat, opacity: Float ) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
    }
    
    public func round() -> Self {
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRectMake(bounds.midX - width / 2, bounds.midY - width / 2, width, width)).cgPath
        self.layer.mask = mask
        return self
    }
}
