//
//  HeaderForOffer.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import UIKit

final class HeaderForOffer: UICollectionReusableView {
    
    //MARK: - Properties
    static let identifire = "HeaderForOffer"
    
    private let promotionOffer = UIImageView()
        .setMyStyle()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        promotionOffer.layer.cornerRadius = ProjectDesign.cornerRadius
    }
    
    private func setViewHierarhies() {
        self.addSubview(promotionOffer)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            promotionOffer.topAnchor.constraint(equalTo: self.topAnchor),
            promotionOffer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promotionOffer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            promotionOffer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
extension HeaderForOffer: ConfigurableView {
    func configure(with model: ModelHeaderView) {
        promotionOffer.image = Images.promotion6
    }
    typealias Model = ModelHeaderView
}

    

