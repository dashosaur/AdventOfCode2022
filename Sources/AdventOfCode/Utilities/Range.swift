//  Range.swift
//  AdventOfCode
//
//  Created by Dash on 12/4/22.
//

import Foundation

extension ClosedRange where Bound == Int {
    func contains(_ range: ClosedRange<Int>) -> Bool {
        contains(range.lowerBound) && contains(range.upperBound)
    }
}
