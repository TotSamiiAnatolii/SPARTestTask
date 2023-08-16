//
//  OfferCell.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class OfferCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifire = "OfferCell"
    
    private let offerImage = UIImageView()
        .setMyStyle()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        offerImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        offerImage.layer.cornerRadius = ProjectDesign.cornerRadius
    }
    
    private func setViewHierarhies() {
        contentView.addSubview(offerImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            offerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            offerImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            offerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
extension OfferCell: ConfigurableView {
    
    func configure(with model: ModelOfferCell) {
        offerImage.image = model.image
    }
    
    typealias Model = ModelOfferCell
}
