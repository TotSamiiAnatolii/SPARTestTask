//
//  Router.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

protocol MenuRouterProtocol {
    
    var tabBarController: TabBarController { get set }
    
    var assemblyBuilder: AssemblyBuilderProtocol { get set }
}

protocol RouterProtocol: MenuRouterProtocol {
    
    func initialViewControllers()
    
    func showDetail(id: String)
    
    func popToRoot()
}

final class Router: RouterProtocol {
    
    var tabBarController: TabBarController
    
    var navigationController: UINavigationController
    
    var assemblyBuilder: AssemblyBuilderProtocol
    
    init(tabBarController: TabBarController, assemblyBuilder: AssemblyBuilderProtocol, navigationController: UINavigationController) {
        self.tabBarController = tabBarController
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController
    }
    
    func initialViewControllers() {
       
        let contacts = tabBarController.createViewController(
            rootViewController: (assemblyBuilder.createList(router: self)),
            image: Images.contacts)
        
        let menu = tabBarController.createViewController(
            rootViewController: (assemblyBuilder.createMain(router: self)),
            image: Images.menu)
//        navigationController.viewControllers = [menu]
        
        let profile = tabBarController.createViewController(
            rootViewController: (assemblyBuilder.createProfile(router: self)),
            image: Images.profile)
       
        let shoppingCart = tabBarController.createViewController(
            rootViewController: (assemblyBuilder.createShoppingCart(router: self)),
            image: Images.shoppingCartTab)
        
        tabBarController.viewControllers = [menu, contacts, profile, shoppingCart]
    }
    
    func showDetail(id: String) {
      
    }
    
    func popToRoot() {
        navigationController.popViewController(animated: true)
    }}

