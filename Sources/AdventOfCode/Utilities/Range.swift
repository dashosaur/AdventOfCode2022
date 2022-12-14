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
    
    init(bound1: Int, bound2: Int) {
        if bound1 > bound2 {
            self = bound2...bound1
        } else {
            self = bound1...bound2
        }
    }
}
