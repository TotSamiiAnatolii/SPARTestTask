//
//  Header.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class HeaderForProducts: UICollectionReusableView {

    static let identifire = "Header"
    
    private let leftIndent: CGFloat = 10
    
    private let rightIndent: CGFloat = 10
    
    private let bottomIndent: CGFloat = 5
    
    private let nameCollection = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .left,
            font: UIFont.boldSystemFont(ofSize: 18))
        .setTextColor(color: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    private func setViewHierarhies() {
        self.addSubview(nameCollection)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            nameCollection.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
extension HeaderForProducts: ConfigurableView {
    func configure(with model: ModelHeaderView) {
        nameCollection.text = model.title
    }
 
    typealias Model = ModelHeaderView
}

