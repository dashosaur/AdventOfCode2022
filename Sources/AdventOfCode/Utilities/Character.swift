//  Character.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/22.
//

import Foundation

extension Character {
    var index: Int? {
        guard let value = asciiValue.map(Int.init) else { return nil }
        if (65...90).contains(value) {
            return value - 38
        } else if (97...122).contains(value) {
            return value - 96
        } else {
            return nil
        }
    }
}
