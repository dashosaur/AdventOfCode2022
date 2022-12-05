//  AOC5.swift
//  AdventOfCode
//
//  Created by Dash on 12/4/22.
//

import Foundation

struct AOC5: Puzzle {
    typealias Answer = String
    
    private typealias Stack = [Character]
    
    private func parseStacks(input: String) -> [Stack] {
        let stackLines = input.lineGroups[0].lines.dropLast(1)
        let stackCount = (stackLines.map(\.count).max()! + 1) / 4
        var stacks: [Stack] = Array(repeatElement(Stack(), count: stackCount))
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
        return stacks
    }
    
    private struct Move {
        let count: Int
        let fromIndex: Int
        let toIndex: Int
    }
    
    private func parseMoves(input: String) -> [Move] {
        input.lineGroups[1].lines.map { line in
            let splits = line.split(separator: " ")
            return Move(count: Int(splits[1])!,
                        fromIndex: Int(splits[3])! - 1,
                        toIndex: Int(splits[5])! - 1)
        }
    }
    
    func solve1(input: String) -> String {
        var stacks = parseStacks(input: input)
        for move in parseMoves(input: input) {
            for _ in 1...move.count {
                if let crate = stacks[move.fromIndex].popLast() {
                    stacks[move.toIndex].append(crate)
                } else {
                    fatalError()
                }
            }
        }
        return String(stacks.compactMap(\.last))
    }
    
    func solve2(input: String) -> String {
        var stacks = parseStacks(input: input)
        for move in parseMoves(input: input) {
            stacks[move.toIndex].append(contentsOf: stacks[move.fromIndex].suffix(move.count))
            stacks[move.fromIndex].removeLast(move.count)
        }
        return String(stacks.compactMap(\.last))
    }
}
