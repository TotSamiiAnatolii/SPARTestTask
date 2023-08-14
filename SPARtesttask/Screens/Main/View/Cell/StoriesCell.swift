//
//  StoriesCell.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class StoriesCell: UICollectionViewCell {
    
    static let identifire = "StoriesCell"
    
    private let circleView = UIView()
        .setStyle()
       
    private let storiesImage = UIImageView()
        .setMyStyle()
    
    private let nameStories = UILabel()
        .setMyStyle(
            numberOfLines: 2,
            textAlignment: .center,
            font: Fonts.stories)
        .setTextColor(color: Colors.fontStories)
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViewHierarhies()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        print(circleView.frame.height)
//        circleView.layer.cornerRadius = 35.5
//        circleView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        nameCategory.text = nil
//        imageCategory.image = nil
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        circleView.layer.cornerRadius = circleView.frame.height / 2
        storiesImage.layer.cornerRadius = storiesImage.frame.height / 2
    }
    
    //MARK: View hierarhies
    private func setViewHierarhies() {
        circleView.addSubview(storiesImage)
        contentView.addSubview(circleView)
        contentView.addSubview(nameStories)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            nameStories.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 8),
            nameStories.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameStories.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: 5),
            nameStories.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            circleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            storiesImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            storiesImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            storiesImage.widthAnchor.constraint(equalTo: circleView.widthAnchor, multiplier: 0.9),
            storiesImage.heightAnchor.constraint(equalTo: storiesImage.widthAnchor)
        ])
    }
}
extension StoriesCell: ConfigurableView {
    func configure(with model: ModelStoriesCell) {
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.green.cgColor
        nameStories.text = model.title
        storiesImage.image = model.image
    }
    
    typealias Model = ModelStoriesCell
}

