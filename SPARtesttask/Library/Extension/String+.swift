//
//  String.swift
//  SPARtesttask
//
//  Created by APPLE on 14.08.2023.
//

import UIKit

extension String {
    
    public func indexCharacter(of char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }
    
    public func fetchString() -> String {
        return  self.components(separatedBy: ".").last!.trimmingCharacters(in: .whitespaces)
    }
}
