//
//  ShoppingCartController.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

protocol ShoppingCartViewProtocol: AnyObject {
    
}

final class ShoppingCartController: UIViewController {
    
    private var presenter: ShoppingCartPresenterProtocol
    
    //MARK: - Init
    init(presenter: ShoppingCartPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension ShoppingCartController: ShoppingCartViewProtocol {
    
}
