//
//  SceneDelegate.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let tabBarController = TabBarController()
        let navigationController = UINavigationController()
        let networkService = NetworkManager()
        let assemblyBuilder = ModuleBuilder(networkService: networkService)
        let router = Router(tabBarController: tabBarController, assemblyBuilder: assemblyBuilder, navigationController: navigationController)
        router.initialViewControllers()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

