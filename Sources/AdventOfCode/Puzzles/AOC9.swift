//  AOC9.swift
//  AdventOfCode
//
//  Created by Dash on 12/8/22.
//

import Foundation

fileprivate extension Point {
    init?(directionText: some StringProtocol) {
        switch directionText {
        case "L":
            self = Point(-1, 0)
        case "R":
            self = Point(1, 0)
        case "U":
            self = Point(0, 1)
        case "D":
            self = Point(0, -1)
        default:
            return nil
        }
    }
    
    mutating func chasePoint(_ otherPoint: Point) {
        let diff = otherPoint - self
        if abs(diff.x) > 1 || abs(diff.y) > 1 {
            x += Int((Double(diff.x) / 2).rounded(.awayFromZero))
            y += Int((Double(diff.y) / 2).rounded(.awayFromZero))
        }
    }
}

struct AOC9: Puzzle {
    typealias Answer = Int
    
    private func solve(input: String, knotCount: Int) -> Int {
        var tailVisits: Set<Point> = [.origin]
        var knots = Array(repeatElement(Point.origin, count: knotCount))
        
        for line in input.lines {
            let vector = Point(directionText: (line.split(separator: " ")[0]))!
            let magnitude = Int(line.split(separator: " ")[1])!
            
            for _ in 0..<magnitude {
                knots[0] = knots[0] + vector
                for i in 1...(knots.count-1) {
                    knots[i].chasePoint(knots[i-1])
                }
                tailVisits.insert(knots.last!)
            }
        }
        
        return tailVisits.count
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, knotCount: 2)
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, knotCount: 10)
    }
}
