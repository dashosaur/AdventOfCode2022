//  AOC1.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/22.
//

import Foundation

struct AOC1: Puzzle {
    func solve1(input: String) -> Int {
        input.lineGroups.map({ $0.integers.sum }).max() ?? 0
    }
    
    func solve2(input: String) -> Int {
        input.lineGroups.map({ $0.integers.sum }).sorted().suffix(3).sum
    }
}
