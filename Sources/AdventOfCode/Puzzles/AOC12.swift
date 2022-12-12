//  AOC12.swift
//  AdventOfCode
//
//  Created by Dash on 12/11/22.
//

import Foundation
import Algorithms

struct AOC12: Puzzle {
    typealias Answer = Int
    
    private func shortestPath(map: [[Int]], startPoints: [Point], endPoint: Point) -> Int? {
        var toVisit = startPoints
        var distanceByPoint = startPoints.reduce(into: [:]) { $0[$1] = 0 }
        
        while let curPoint = toVisit.first, let curDistance = distanceByPoint[curPoint], let curHeight = map[curPoint] {
            toVisit.removeFirst()
            for nextPoint in curPoint.neighbors {
                guard let nextHeight = map[nextPoint], nextHeight <= curHeight + 1 else { continue }
                if (curDistance + 1) < distanceByPoint[nextPoint, default: Int.max] {
                    distanceByPoint[nextPoint] = (curDistance + 1)
                    toVisit.append(nextPoint)
                }
            }
        }
        
        return distanceByPoint[endPoint]
    }
    
    private func solve(input: String, startCharacters: [Character]) -> Int {
        let lines = input.lines.map { Array($0) }
        let map = lines.map { $0.map(\.height) }
        
        var starts = [Point]()
        var end = Point.origin
        for point in product(0..<lines.count, 0..<lines[0].count).map({ Point($0.0, $0.1) }) {
            guard let character = lines[point] else { continue }
            if startCharacters.contains(character) {
                starts.append(point)
            } else if character == "E" {
                end = point
            }
        }
        return shortestPath(map: map, startPoints: starts, endPoint: end)!
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, startCharacters: ["S"])
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, startCharacters: ["S", "a"])
    }
}

fileprivate extension Character {
    var height: Int {
        (self == "S" ? "a" : (self == "E" ? "z" : self)).index!
    }
}
