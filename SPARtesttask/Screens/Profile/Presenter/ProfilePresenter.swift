//
//  ProfilePresenter.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

protocol ProfilePresenterProtocol {
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol)
}

final class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    
    private let router: RouterProtocol
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
    }
    
}
