//  AOC4.swift
//  AdventOfCode
//
//  Created by Dash on 12/3/22.
//

import Foundation

fileprivate extension ClosedRange where Bound == Int {
    init(_ text: any StringProtocol) {
        let splits = text.split(separator: "-")
        self = Int(splits[0])!...Int(splits[1])!
    }
}

struct AOC4: Puzzle {
    private func parseRanges(line: String) -> (ClosedRange<Int>, ClosedRange<Int>) {
        let ranges = line.split(separator: ",").map(ClosedRange.init)
        return (ranges[0], ranges[1])
    }
    
    func solve1(input: String) -> Int {
        input.lines.count { line in
            let (r1, r2) = parseRanges(line: line)
            return Set(r1).isSubset(of: Set(r2)) || Set(r2).isSubset(of: Set(r1))
        }
    }
    
    func solve2(input: String) -> Int {
        input.lines.count { line in
            let (r1, r2) = parseRanges(line: line)
            return r1.overlaps(r2)
        }
    }
}
