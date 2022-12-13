//  AOC13.swift
//  AdventOfCode
//
//  Created by Dash on 12/12/22.
//

import Foundation

fileprivate extension String {
    func nextElementString(from startIndex: Int) -> String? {
        var stackCount = 0
        for (i, c) in enumerated() where i >= startIndex {
            if c == "[" {
                stackCount += 1
            } else if c == "]" {
                stackCount -= 1
            }
            if stackCount == 0, Array(self)[safe: i+1]?.isNumber != true {
                return self[startIndex..<(i + 1)]
            }
        }
        return nil
    }
}

struct AOC13: Puzzle {
    typealias Answer = Int
    
    enum Result {
        case increasing
        case decreasing
        case `continue`
    }
    
    func compare(left: String, right: String, indent: Int = 0) -> Result {
        // If both are Ints, compare directly
        if let i1 = Int(left), let i2 = Int(right) {
            if i1 < i2 { return .increasing }
            if i1 > i2 { return .decreasing }
            return .continue
        }
        
        // If only one is an Int, convert it to an Array and compare
        if let i1 = Int(left) {
            return compare(left: "[\(i1)]", right: right, indent: indent + 1)
        }
        if let i2 = Int(right) {
            return compare(left: left, right: "[\(i2)]", indent: indent + 1)
        }
        
        // Both are Arrays, compare each element until there's a result
        var li = 1, ri = 1
        while true {
            let l1 = left.nextElementString(from: li)
            let r1 = right.nextElementString(from: ri)
            if l1 == nil && r1 == nil {
                return .continue
            }
            guard let l1 else { return .increasing }
            guard let r1 else { return .decreasing }
            let result = compare(left: l1, right: r1, indent: indent + 1)
            if result == .continue {
                li += l1.count
                ri += r1.count
                
                while left[li] == "," { li += 1 }
                while right[ri] == "," { ri += 1 }
            } else {
                return result
            }
        }
    }
    
    func solve1(input: String) -> Int {
        input.lineGroups.enumerated().reduceSum { (i, lineGroup) in
            compare(left: lineGroup.lines[0], right: lineGroup.lines[1]) == .increasing ? i + 1 : 0
        }
    }
    
    func solve2(input: String) -> Int {
        let dividerPackets = ["[[2]]", "[[6]]"]
        var packets = input.lines.filter({ $0.count > 0 }) + dividerPackets
        packets.sort(by: { compare(left: $0, right: $1) == .increasing })
        return dividerPackets.reduce(1) { $0 * (packets.firstIndex(of: $1)! + 1) }
    }
}
