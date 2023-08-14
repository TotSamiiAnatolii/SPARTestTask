//
//  ShoppingCartButton.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import UIKit

final class ShoppingCartButton: UIButton {
    
    private let shoppingCartImage = UIImageView()
        .setMyStyle()
        .setImage(image: Images.shoppingCart)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.height / 2
    }
    
    override var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? .orange.withAlphaComponent(0.5) : .orange
        }
    }
    
    override var isSelected: Bool {
        didSet {
            
            switch isSelected {
            case true:
                self.setImage(Images.shoppingCart1, for: .normal)
            case false:
                self.setImage(Images.shoppingCart, for: .normal)
            }
        }
    }
    
    private func setupView() {
        backgroundColor = Colors.shoppingCart
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setViewHierarhies() {
        addSubview(shoppingCartImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            shoppingCartImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shoppingCartImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shoppingCartImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            shoppingCartImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
    }
}
