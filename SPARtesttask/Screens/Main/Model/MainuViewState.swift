//
//  MenuViewState.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

enum MainViewState {
    case loading
    case papulated([String: String])
    case error(Error)
}

enum StateDowload {
    case loading
    case downloadFinished
}
