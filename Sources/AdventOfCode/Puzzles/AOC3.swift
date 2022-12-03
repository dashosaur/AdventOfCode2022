//  AOC3.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/22.
//

import Foundation

fileprivate extension Character {
    var priority: Int { index! }
}

struct AOC3: Puzzle {
    func solve1(input: String) -> Int {
        input.lines.reduceSum { line in
            let count = line.count / 2
            let firstRucksack = Set(line.prefix(count))
            return line.suffix(count)
                .first { firstRucksack.contains($0) }!
                .priority
        }
    }
    
    func solve2(input: String) -> Int {
        let lines = input.lines
        let groupSize = 3
        return stride(from: 0, to: lines.count - 1, by: groupSize).reduceSum { lineIndex in
            (1..<groupSize)
                .reduce(Set(lines[lineIndex])) { $0.intersection(lines[lineIndex + $1]) }
                .first!
                .priority
        }
    }
}
