//
//  MainCell.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class MainCell: UICollectionViewCell {
    
    static let identifire = "MainCell"
    
    private let productImage = UIImageView()
        .setMyStyle()
    
    private let shoppingCartButton = ShoppingCartButton()
    
    private let priceLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .center,
            font: UIFont.boldSystemFont(ofSize: 15))
        .setTextColor(color: UIColor.black)
    
    private let mainStack = UIStackView()
        .myStyleStack(
            spacing: 7,
            alignment: .fill ,
            axis: .vertical,
            distribution: .equalSpacing,
            userInteraction: false)
        .setLayoutMargins(top: 5, left: 5, bottom: 0, right: 5)
    
    private let priceStack = UIStackView()
        .myStyleStack(
            spacing: 5,
            alignment: .fill ,
            axis: .horizontal,
            distribution: .equalSpacing,
            userInteraction: false)
        .setLayoutMargins(top: 0, left: 5, bottom: 5, right: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadowCell()
        setupCornerRadiusCell()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    private func setViewHierarhies() {
        contentView.addSubview(mainStack)
        contentView.addSubview(shoppingCartButton)
        contentView.addSubview(priceStack)
        priceStack.addArrangedSubview(priceLabel)
        priceStack.addArrangedSubview(shoppingCartButton)
        mainStack.addArrangedSubview(productImage)
        mainStack.addArrangedSubview(priceStack)
    }
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shoppingCartButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            shoppingCartButton.heightAnchor.constraint(equalTo: shoppingCartButton.widthAnchor),
        ])
    }
    
    private func setupCornerRadiusCell() {
        contentView.layer.cornerRadius = ProjectDesign.cornerRadius
        contentView.clipsToBounds = false
    }
    
    private func setupShadowCell() {
        layer.shadowColor = #colorLiteral(red: 0.638755664, green: 0.638755664, blue: 0.638755664, alpha: 1)
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2.5
        layer.shadowOpacity = 0.8
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: ProjectDesign.cornerRadius).cgPath
        layer.cornerRadius = ProjectDesign.cornerRadius
    }
}
extension MainCell: ConfigurableView {
    
    func configure(with model: ModelMainCell) {
        contentView.backgroundColor = .white
        
        productImage.image = model.image
        priceLabel.text = "13,ddddddddhhhh45"
    }
    typealias Model = ModelMainCell
}
