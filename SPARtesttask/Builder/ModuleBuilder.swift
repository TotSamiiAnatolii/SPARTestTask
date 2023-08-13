//
//  ModuleBuilder.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createList(router: RouterProtocol) -> UIViewController
    func createProfile(router: RouterProtocol) -> UIViewController
    func createShoppingCart(router: RouterProtocol) -> UIViewController
}

final class ModuleBuilder: AssemblyBuilderProtocol {
    
    let networkService: NetworkManager
    
    init(networkService: NetworkManager) {
        self.networkService = networkService
    }
        
    func createMain(router: RouterProtocol) -> UIViewController {
        let presenter = MainPresenter(networkService: networkService, router: router)
        let view = MainViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    func createList(router: RouterProtocol) -> UIViewController {
        let presenter = ListPresenter(networkService: networkService, router: router)
        let view = ListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    func createProfile(router: RouterProtocol) -> UIViewController {
        let presenter = ProfilePresenter(networkService: networkService, router: router)
        let view = ProfileViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    func createShoppingCart(router: RouterProtocol) -> UIViewController {
        let presenter = ShoppingCartPresenter(networkService: networkService, router: router)
        let view = ShoppingCartController(presenter: presenter)
        presenter.view = view
        return view
    }
}
