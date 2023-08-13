//
//  ConfigurableView.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

protocol ConfigurableView {
    
    associatedtype Model
    
    func configure(with model: Model)
}
