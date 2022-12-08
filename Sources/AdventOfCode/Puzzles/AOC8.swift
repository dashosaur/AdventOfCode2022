//  AOC8.swift
//  AdventOfCode
//
//  Created by Dash on 12/7/22.
//

import Foundation
import Algorithms

fileprivate struct Location {
    let row: Int
    let col: Int
}

fileprivate extension [[Int]] {
    var locations: some Sequence<Location> {
        product(0..<count, 0..<self[0].count).map({ Location(row: $0.0, col: $0.1) })
    }
    
    func canSeeTree(atRow row: Int, col: Int) -> Bool {
        (0..<col).allSatisfy({ self[row][$0] < self[row][col] }) ||
        (col+1..<self[0].count).allSatisfy({ self[row][$0] < self[row][col] }) ||
        (0..<row).allSatisfy({ self[$0][col] < self[row][col] }) ||
        (row+1..<self.count).allSatisfy({ self[$0][col] < self[row][col] })
    }
    
    func scenicScoreForTree(atRow row: Int, col: Int) -> Int {
        let height = self.count, width = self[0].count
        let tree = self[row][col]
        var scores = [Int]()
        
        if let count = (0..<col).reversed().enumerated().first(where: { self[row][$0.element] >= tree }) {
            scores.append(count.offset + 1)
        } else {
            scores.append(col)
        }
        
        if let count = (col+1..<height).enumerated().first(where: { self[row][$0.element] >= tree }) {
            scores.append(count.offset + 1)
        } else {
            scores.append(height - col - 1)
        }
        
        if let count = (0..<row).reversed().enumerated().first(where: { self[$0.element][col] >= tree }) {
            scores.append(count.offset + 1)
        } else {
            scores.append(row)
        }
        
        if let count = (row+1..<width).enumerated().first(where: { self[$0.element][col] >= tree }) {
            scores.append(count.offset + 1)
        } else {
            scores.append(width - row - 1)
        }
        
        return scores.reduce(1, *)
    }
}

struct AOC8: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let grid = input.digitGrid
        return grid.locations.reduce(0) {
            $0 + (grid.canSeeTree(atRow: $1.row, col: $1.col) ? 1 : 0)
        }
    }
    
    func solve2(input: String) -> Int {
        let grid = input.digitGrid
        return grid.locations.reduce(0) {
            max($0, grid.scenicScoreForTree(atRow: $1.row, col: $1.col))
        }
    }
}
