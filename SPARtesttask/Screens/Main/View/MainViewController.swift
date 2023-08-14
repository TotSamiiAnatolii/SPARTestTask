//
//  ViewController.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

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
    
    private let presenter: MainPresenterProtocol
    
    private let myDataSource = DataSource()

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
        configureNavigationBar()
        reloadData(stories: myDataSource.stroiesList,
                   banners: myDataSource.bannersList,
                   offers: myDataSource.offersList,
                   main: myDataSource.categories[SectionType.main.nameTitle]!,
                   sweetMood: myDataSource.categories[SectionType.sweetMood.nameTitle]!)
    }
    
    private func configureCollectionView() {
        mainView.collectionView.collectionViewLayout = createCompositionalLayout()
        mainView.collectionView.register(StoriesCell.self, forCellWithReuseIdentifier: StoriesCell.identifire)
        mainView.collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifire)
        mainView.collectionView.register(OfferCell.self, forCellWithReuseIdentifier: OfferCell.identifire)
        mainView.collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.identifire)
        mainView.collectionView.register(HeaderForProducts.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForProducts.identifire)
        mainView.collectionView.register(HeaderForOffer.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForOffer.identifire)
        mainView.collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 40, right: 0)
    }
    
    private func configureNavigationBar() {
        guard let navigationController else {
            return
        }
        let heightNavBar = navigationController.navigationBar.bounds.height * 0.85
        let widthNavBar = navigationController.navigationBar.bounds.width
        
        let searchBar = CitySelectionTextField(image: Images.geoTag, frame: CGRect(x: 0, y: 0, width: widthNavBar, height: heightNavBar))
        searchBar.text = "Москва, Москва и Московская область"

        let menuButton = UIBarButtonItem(image: Images.listButton, landscapeImagePhone: nil, style: .done, target: self, action: nil)
        
        self.setupNavBar(leftItem: nil, rightItem: menuButton, titleView: searchBar)
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, AnyHashable>(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            guard let section = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell()}
            
            switch section {
            case .stories:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCell.identifire, for: indexPath) as? StoriesCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.myDataSource.stroiesList[indexPath.row])
                return cell
                
            case .banner:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifire, for: indexPath) as? BannerCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.myDataSource.bannersList[indexPath.row])
                return cell
                
            case .offer:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCell.identifire, for: indexPath) as? OfferCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.myDataSource.offersList[indexPath.row])
                return cell
                
            case .main:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifire, for: indexPath) as? MainCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: (self.myDataSource.categories[section.nameTitle]?[indexPath.row])!)
                return cell
                
            case .sweetMood:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifire, for: indexPath) as? MainCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: (self.myDataSource.categories[section.nameTitle]?[indexPath.row])!)
                return cell
            }
        })
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return UICollectionReusableView()
            }
            
            guard let section = SectionType(rawValue: indexPath.section) else { return UICollectionReusableView()}
            
            switch section {
            
            case .offer:
                guard let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderForOffer.identifire,
                    for: indexPath) as? HeaderForOffer else { return UICollectionReusableView() }
                
                view.configure(with: ModelHeaderView(title: nil))
                return view
                
            case .main:
                guard let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderForProducts.identifire,
                    for: indexPath) as? HeaderForProducts else { return UICollectionReusableView() }

                view.configure(with: ModelHeaderView(title: section.nameTitle))
                return view
                
            case .sweetMood:
                let view = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderForProducts.identifire,
                    for: indexPath) as? HeaderForProducts

                view?.configure(with: ModelHeaderView(title: section.nameTitle))
                return view
                
            default:
                return UICollectionReusableView()
            }
        }
    }
    
    private func reloadData(stories: [ModelStoriesCell],
                            banners: [ModelBannerCell],
                            offers: [ModelOfferCell],
                            main: [ModelMainCell],
                            sweetMood: [ModelMainCell]) {
    
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        snapshot.appendSections([.stories, .banner, .offer, .main, .sweetMood])
        snapshot.appendItems(stories, toSection: .stories)
        snapshot.appendItems(banners, toSection: .banner)
        snapshot.appendItems(offers, toSection: .offer)
        snapshot.appendItems(main, toSection: .main)
        snapshot.appendItems(sweetMood, toSection: .sweetMood)
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
            case .sweetMood:
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
