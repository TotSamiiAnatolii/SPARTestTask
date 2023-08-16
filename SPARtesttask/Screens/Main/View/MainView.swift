//
//  MainView.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class MainView: UIView {
            
    //MARK: - Properties
    public var collectionView: UICollectionView!
    
    public let searchBar = CitySelectionTextField(image: Images.geoTag, frame: .zero)

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCollectionView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup collectionView
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func setViewHierarhies() {
        self.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension MainView: ConfigurableView {
    
    func configure(with model: ModelMainView) {

    }
    
    typealias Model = ModelMainView
}
