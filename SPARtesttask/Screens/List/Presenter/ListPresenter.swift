//
//  ListPresenter.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

protocol ListPresenterProtocol {
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol)
}

final class ListPresenter: ListPresenterProtocol{
    
    weak var view: ListViewProtocol?
    
    private let router: RouterProtocol
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
    }
}
