//
//  Promotion.swift
//  SPARtesttask
//
//  Created by APPLE on 14.08.2023.
//

import UIKit

protocol PromotionViewProtocol {
    
    init(color: UIColor)
    
    func setNamePromotion(_ text: String)
    
    func appearanceСontrol(state: Bool)
    
}

final class PromotionView: UIView {
    
    private let color: UIColor
    
    private let promotionLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .center,
            font: UIFont.systemFont(ofSize: 12, weight: .semibold))
        .setTextColor(color: .white)
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        configureView()
        setViewHierarhies()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    
    private func configureView() {
        backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        setNamePromotion()
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = 5
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }

    private func setViewHierarhies() {
        addSubview(promotionLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            promotionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            promotionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            promotionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promotionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
extension PromotionView: PromotionViewProtocol {
    func appearanceСontrol(state: Bool) {
        isHidden = state
    }
    
    func setNamePromotion(_ text: String = "Sale") {
        promotionLabel.text = text
    }
}
