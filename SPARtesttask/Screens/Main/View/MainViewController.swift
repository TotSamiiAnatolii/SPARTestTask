//
//  ViewController.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

enum SectionType: Int {
    case stories
    case banner
    case offer
    case main
}

protocol MainViewProtocol: AnyObject {
    
    func succes(models: Any)
        
    func failure(error: Error)
    
    func loading(state: StateDowload)
}

final class MainViewController: UIViewController {
    
    //MARK: - Main view
    fileprivate var mainView: MainView {
        guard let view = self.view as? MainView else {
            return MainView()
        }
        return view
    }
    
    private let compositionalLayout = CompositionalLayout()
    
    private var dataSource: UICollectionViewDiffableDataSource<SectionType, AnyHashable>?
    
    private var presenter: MainPresenterProtocol
    
    private var stroiesList: [ModelStoriesCell] = [ModelStoriesCell(id: "1"), ModelStoriesCell(id: "2"), ModelStoriesCell(id: "3"), ModelStoriesCell(id: "4"), ModelStoriesCell(id: "5"), ModelStoriesCell(id: "6"), ModelStoriesCell(id: "7"), ModelStoriesCell(id: "8"), ModelStoriesCell(id: "9"), ModelStoriesCell(id: "10")]
    
    private var bannersList: [ModelBannerCell] = [ModelBannerCell(id: "6", image: Images.promotion1), ModelBannerCell(id: "7", image: Images.promotion2), ModelBannerCell(id: "8", image: Images.promotion3), ModelBannerCell(id: "9", image: Images.promotion4), ModelBannerCell(id: "10", image: Images.promotion5)]
    
    private var offersList: [ModelOfferCell] = [ModelOfferCell(id: "11"), ModelOfferCell(id: "12"), ModelOfferCell(id: "13"), ModelOfferCell(id: "14"), ModelOfferCell(id: "15")]
    
    private var mainList: [ModelMainCell] = [ModelMainCell(id: "16", image: Images.pr1), ModelMainCell(id: "17", image: Images.pr2), ModelMainCell(id: "18", image: Images.pr3), ModelMainCell(id: "19", image: Images.pr4), ModelMainCell(id: "20", image: Images.pr5)]
    
    //MARK: - Init
    init(presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        createDataSource()
        reloadData(stories: stroiesList, banners: bannersList, offers: offersList, main: mainList)
    }
    
    private func configureCollectionView() {
        mainView.collectionView.collectionViewLayout = createCompositionalLayout()
        
        mainView.collectionView.register(StoriesCell.self, forCellWithReuseIdentifier: StoriesCell.identifire)
        
        mainView.collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifire)
        
        mainView.collectionView.register(OfferCell.self, forCellWithReuseIdentifier: OfferCell.identifire)
        
        mainView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.identifire)
        
        mainView.collectionView.register(HeaderForProducts.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForProducts.identifire)
        
        mainView.collectionView.register(HeaderForOffer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForOffer.identifire)
        
        mainView.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 90, right: 0)
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, AnyHashable>(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let section = SectionType(rawValue: indexPath.section)
            
            switch section {
            case .stories:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCell.identifire, for: indexPath) as? StoriesCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.stroiesList[indexPath.row])
                return cell
                
            case .banner:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifire, for: indexPath) as? BannerCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.bannersList[indexPath.row])
                return cell
                
            case .offer:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCell.identifire, for: indexPath) as? OfferCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.offersList[indexPath.row])
                return cell
                
            case .main:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifire, for: indexPath) as? MainCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.mainList[indexPath.row])
                return cell

            case .none:
                return UICollectionViewCell()
            }
        })
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            
            guard let section = SectionType(rawValue: indexPath.section) else { return UICollectionReusableView()}
            
            switch section {
            
            case .offer:
                let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderForOffer.identifire,
                    for: indexPath) as? HeaderForOffer
                
                view?.configure(with: ModelHeaderView())
                return view
                
            case .main:
                let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderForProducts.identifire,
                    for: indexPath) as? HeaderForProducts

                view?.configure(with: ModelHeaderView())
                return view
                
            default:
                return UICollectionReusableView()
            }
        }
    }
    
    private func reloadData(stories: [ModelStoriesCell],
                            banners: [ModelBannerCell],
                            offers: [ModelOfferCell],
                            main: [ModelMainCell]) {
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        snapshot.appendSections([.stories, .banner, .offer, .main])
        snapshot.appendItems(stories, toSection: .stories)
        snapshot.appendItems(banners, toSection: .banner)
        snapshot.appendItems(offers, toSection: .offer)
        snapshot.appendItems(main, toSection: .main)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = SectionType(rawValue: sectionIndex)
            
            switch section {
            case .stories:
                return self.compositionalLayout.setStoriesFlowLayout()
            case .banner:
                return self.compositionalLayout.setBannerFlowLayout()
            case .offer:
                return self.compositionalLayout.setOfferFlowLayout()
            case .main:
                return self.compositionalLayout.setProductFlowLayout()
            case .none:
               return nil
            }
        }
        return layout
    }
}
extension MainViewController: MainViewProtocol {
    
    func succes(models: Any) {
        
    }
    
    func failure(error: Error) {
        
    }
    
    func loading(state: StateDowload) {
        
    }
}
