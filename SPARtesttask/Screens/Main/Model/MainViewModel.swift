//
//  MainViewModel.swift
//  SPARtesttask
//
//  Created by APPLE on 12.08.2023.
//

import Foundation

enum SectionType: Int {
    case stories
    case banner
    case offer
    case main
    case sweetMood
    
    var nameTitle: String {
        switch self {
        case .main:
            return "Рекомендуем"
        case .sweetMood:
            return "Сладкое настроение"
        default:
            return ""
        }
    }
}

struct ModelMainView {
    
}
