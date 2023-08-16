//
//  BannerCell.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifire = "BannerCell"
    
    private let promotionImage = UIImageView()
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
        promotionImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        promotionImage.layer.cornerRadius = ProjectDesign.cornerRadius
    }
    
    private func setViewHierarhies() {
        contentView.addSubview(promotionImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            promotionImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            promotionImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            promotionImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            promotionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
extension BannerCell: ConfigurableView {
    func configure(with model: ModelBannerCell) {
        promotionImage.image = model.image
    }
    
    typealias Model = ModelBannerCell
}
