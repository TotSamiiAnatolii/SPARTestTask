//
//  ShoppingCartButton.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import UIKit

final class ShoppingCartButton: UIButton {
    
    //MARK: - Properties
    private let shoppingCartImage = UIImageView()
        .setMyStyle()
        .setImage(image: Images.shoppingCart)
    
    //MARK: - Init
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
             isHighlighted ? touchDown() : touchUp()
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
    
    private func touchDown() {
        let scaleX = 0.98
        let scaleY = 0.98
    
        self.shoppingCartImage.alpha = 0.5
        self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
    }
    
    private func  touchUp() {
        let scaleX = 1.0
        let scaleY = 1.0
        
        UIView.animateKeyframes(withDuration: 0.4,
                                delay: 0,
                                options: [.beginFromCurrentState,
                                          .allowUserInteraction],
                                animations: {
           
            self.shoppingCartImage.alpha = 1
            self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        })
    }
}
