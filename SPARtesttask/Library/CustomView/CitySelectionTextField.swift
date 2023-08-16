//
//  CitySelectionTextField.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import UIKit

final class CitySelectionTextField: UITextField {
    
    private let leftPadding: CGFloat = 5
    
    private let leftImage: UIImage
    
    init(image: UIImage, frame: CGRect) {
        self.leftImage = image
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    private func configureView() {
        placeholder = "Ваш город?"
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderWidth = 0.8
        layer.borderColor = Colors.borderColorCitySelection
        font = Fonts.citySelect
        textColor = Colors.fontStories
        setLeftViewMode1(viewMode: .always, image: leftImage)
    }
    
    private func setLeftViewMode1(viewMode: UITextField.ViewMode, image: UIImage) {
        let viewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        viewContainer.addSubview(imageView)
        imageView.center = viewContainer.center
        self.leftViewMode = viewMode
        self.leftView = viewContainer
    }
}
