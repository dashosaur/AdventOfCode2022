//  AOC4.swift
//  AdventOfCode
//
//  Created by Dash on 12/3/22.
//

import Foundation

struct AOC4: Puzzle {
    typealias Answer = Int
    
    private func compareRanges(in line: String, comparator: (ClosedRange<Int>, ClosedRange<Int>) -> Bool) -> Bool {
        let ranges = line.split(separator: ",").map(\.range)
        return comparator(ranges[0], ranges[1])
    }
    
    func solve1(input: String) -> Int {
        input.lines.count { line in
            compareRanges(in: line) { r1, r2 in
                r1.contains(r2) || r2.contains(r1)
            }
        }
    }
    
    func solve2(input: String) -> Int {
        input.lines.count { line in
            compareRanges(in: line) { r1, r2 in
                r1.overlaps(r2)
            }
        }
    }
}
