//
//  MainView.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

final class MainView: UIView {
    
//    public var selectCategoryCollection: UICollectionView!
        
    public var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
//        setupSelectCategoryCollection()
        setupCollectionView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setupSelectCategoryCollection() {
//        let layout = UICollectionViewFlowLayout()
//        selectCategoryCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
//        selectCategoryCollection.backgroundColor = .white
//        selectCategoryCollection.translatesAutoresizingMaskIntoConstraints = false
//        selectCategoryCollection.showsHorizontalScrollIndicator = false
//    }
    
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
      
//        self.addSubview(selectCategoryCollection)
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
