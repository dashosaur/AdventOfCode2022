//  AOC5.swift
//  AdventOfCode
//
//  Created by Dash on 12/4/22.
//

import Foundation

struct AOC5: Puzzle {
    typealias Answer = String
    
    private func solve(input: String, reverse: Bool) -> String {
        // Parse stacks into arrays of characters that represent crates
        let stackLines = input.lineGroups[0].lines.dropLast(1)
        let stackCount = (stackLines.map(\.count).max()! + 1) / 4
        var stacks: [[Character]] = Array(repeatElement([Character](), count: stackCount))
        for line in stackLines.reversed() {
            for stackIndex in 0..<stackCount {
                let characterIndex = 1 + 4 * stackIndex
                if characterIndex < line.count {
                    let crate = line[characterIndex]
                    if !crate.isWhitespace {
                        stacks[stackIndex].append(crate)
                    }
                }
            }
        }
        
        // Parse moves into count and stack indexes
        let moves = input.lineGroups[1].lines.map { line in
            let splits = line.split(separator: " ")
            return (count: Int(splits[1])!,
                    fromIndex: Int(splits[3])! - 1,
                    toIndex: Int(splits[5])! - 1)
        }
        
        // Execute all the moves
        for move in moves {
            let crates = stacks[move.fromIndex].suffix(move.count)
            stacks[move.toIndex].append(contentsOf: reverse ? Array(crates.reversed()) : Array(crates))
            stacks[move.fromIndex].removeLast(move.count)
        }
        
        // Concatanate the top crate from each stack
        return String(stacks.compactMap(\.last))
    }
    
    func solve1(input: String) -> String {
        solve(input: input, reverse: true)
    }
    
    func solve2(input: String) -> String {
        solve(input: input, reverse: false)
    }
}
