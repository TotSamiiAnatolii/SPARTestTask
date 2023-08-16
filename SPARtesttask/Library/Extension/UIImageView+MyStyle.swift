//
//  UIImageView+MyStyle.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import UIKit

extension UIImageView {

    public func setMyStyle() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        return self
    }
    
    public func setImage(image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    public func setTintColor(color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
}

