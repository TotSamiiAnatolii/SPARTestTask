//
//  OfferCell.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class OfferCell: UICollectionViewCell {
    
    static let identifire = "OfferCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = ProjectDesign.cornerRadius
    }
}
extension OfferCell: ConfigurableView {
    func configure(with model: ModelOfferCell) {
        contentView.backgroundColor = .yellow
    }
    
    typealias Model = ModelOfferCell
}
