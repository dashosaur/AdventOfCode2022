//  Bool.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/21.
//

import Foundation

extension Bool {
    init(_ character: Character) {
        self = character != "0"
    }
}
