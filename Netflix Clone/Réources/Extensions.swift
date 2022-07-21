//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Apple on 21/07/2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
