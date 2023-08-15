//
//  UILabel+.swift
//  SPARtesttask
//
//  Created by APPLE on 15.08.2023.
//

import UIKit

extension UILabel {

    public func resizePrice(price: String) {
        let currentDecimal = Character(",")
        guard let startIndex = price.indexCharacter(of: currentDecimal) else {
            self.text = price
            return
        }
        
        let amountText = NSMutableAttributedString.init(string: price)
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                                  NSAttributedString.Key.foregroundColor: UIColor.black],
                                 range: NSRange(location: startIndex, length: amountText.length - startIndex))
        self.attributedText = amountText
    }
    
    public func setStrikethroughStyle1() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}


