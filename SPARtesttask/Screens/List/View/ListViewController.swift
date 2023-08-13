//
//  ListViewController.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

protocol ListViewProtocol: AnyObject {
    
}

final class ListViewController: UIViewController {
    
    private var presenter: ListPresenter
    
    //MARK: - Init
    init(presenter: ListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension ListViewController: ListViewProtocol {
    
}
