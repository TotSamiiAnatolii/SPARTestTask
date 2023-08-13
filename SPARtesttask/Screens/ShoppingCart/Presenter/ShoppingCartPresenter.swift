//
//  ShoppingCartPresenter.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

protocol ShoppingCartPresenterProtocol {
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol)
}

final class ShoppingCartPresenter: ShoppingCartPresenterProtocol {
    
    weak var view: ShoppingCartViewProtocol?
    
    private let router: RouterProtocol
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
    }
}
