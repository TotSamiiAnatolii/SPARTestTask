//
//  PresenterMain.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    init(networkService: NetworkServiceProtocol, router: RouterProtocol)
    
    func setViewState(state: MainViewState)
}

final class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    
    private let router: RouterProtocol
    
    private var stateView: MainViewState = .loading {
        didSet {
            setViewState(state: stateView)
        }
    }
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
    }
    
    func setViewState(state: MainViewState) {
        switch state {
        case .loading:
            view?.loading(state: .loading)
        case .papulated(let list):
            view?.loading(state: .downloadFinished)
            view?.succes(models: list)
        case .error(let error):
            view?.failure(error: error)
        }
    }
}
