//
//  ProfileViewController.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    
}

final class ProfileViewController: UIViewController {
    
    private var presenter: ProfilePresenterProtocol
    
    //MARK: - Init
    init(presenter: ProfilePresenterProtocol) {
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
extension ProfileViewController: ProfileViewProtocol {
    
}
