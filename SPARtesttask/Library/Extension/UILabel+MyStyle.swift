//
//  UILabel+MyStyle.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

extension UILabel {
    
    public func setMyStyle(numberOfLines: Int, textAlignment: NSTextAlignment, font: UIFont) -> Self {
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    public func setTextColor(color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    public func setHidden() -> Self {
        self.isHidden = true
        return self
    }
    
    public func setLineBreakMode(lineBreak: NSLineBreakMode ) -> Self {
        self.lineBreakMode = lineBreak
        return self
    }
    
    public func resizePrice(price: String) {
        let currentDecimal = Character(",")
        let amountText = NSMutableAttributedString.init(string: price)
        
        guard let startIndex = price.indexCharacter(of: currentDecimal) else {
            self.text = price
            return
        }
        
        let endIndex = amountText.length - startIndex
        
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                                  NSAttributedString.Key.foregroundColor: Colors.priceProductCell],
                                 range: NSRange(location: startIndex, length: endIndex))
        self.attributedText = amountText
    }
    
    public func setStrikethroughStyle(price: String?) {
        
        guard let price = price else {
            self.text = nil
            return
        }
      
            let attributedString = NSMutableAttributedString(string: price)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        
    }

}
