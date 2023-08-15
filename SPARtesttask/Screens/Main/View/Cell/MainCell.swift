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
    
    private let promotionView = PromotionView(color: Colors.promotionView)
    
    private let priceLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .left,
            font: Fonts.priceProductCell)
        .setTextColor(color: Colors.priceProductCell)
    
    private let mainStack = UIStackView()
        .myStyleStack(
            spacing: 7,
            alignment: .fill ,
            axis: .vertical,
            distribution: .equalSpacing,
            userInteraction: false)
        .setLayoutMargins(top: ProjectDesign.indentProductCell,
                          left: ProjectDesign.indentProductCell,
                          bottom: ProjectDesign.indentProductCell,
                          right: ProjectDesign.indentProductCell)
    
    private let priceStack = UIStackView()
        .myStyleStack(
            spacing: 5,
            alignment: .fill ,
            axis: .horizontal,
            distribution: .equalSpacing,
            userInteraction: false)
    
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
        setupShadowCell()
        setupCornerRadiusCell()
    }
  
    private func setViewHierarhies() {
        contentView.addSubview(mainStack)
        contentView.addSubview(shoppingCartButton)
        contentView.addSubview(priceStack)
        priceStack.addArrangedSubview(priceLabel)
        priceStack.addArrangedSubview(shoppingCartButton)
        mainStack.addArrangedSubview(productImage)
        mainStack.addArrangedSubview(priceStack)
        contentView.addSubview(promotionView)
    }
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            shoppingCartButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.27),
            shoppingCartButton.heightAnchor.constraint(equalTo: shoppingCartButton.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            promotionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            promotionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            promotionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.12),
            promotionView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
    }
    
    private func setupCornerRadiusCell() {
        contentView.layer.cornerRadius = ProjectDesign.cornerRadius
        contentView.clipsToBounds = true
    }
    
    private func setupShadowCell() {
        layer.shadowColor = Colors.shadowColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2.5
        layer.shadowOpacity = 0.8
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: ProjectDesign.cornerRadius).cgPath
        layer.cornerRadius = ProjectDesign.cornerRadius
    }
}
extension MainCell: ConfigurableView {
    
    func configure(with model: ModelMainCell) {
        productImage.image = model.image
        priceLabel.resizePrice(price: model.price)
        promotionView.appearanceСontrol(state: model.promotion)
    }
    
    typealias Model = ModelMainCell
}
