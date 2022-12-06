//  AOC6.swift
//  AdventOfCode
//
//  Created by Dash on 12/5/22.
//

import Foundation
import Algorithms

struct AOC6: Puzzle {
    typealias Answer = Int
    
    private func solve(input: String, windowSize: Int) -> Int {
        input.windows(ofCount: windowSize).enumerated().first(where: { Set($0.element).count == $0.element.count })!.offset + windowSize
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, windowSize: 4)
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, windowSize: 14)
    }
}
