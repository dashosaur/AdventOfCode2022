//  AOC12.swift
//  AdventOfCode
//
//  Created by Dash on 12/11/22.
//

import Foundation
import Algorithms

fileprivate extension Character {
    var height: Int {
        (self == "S" ? "a" : (self == "E" ? "z" : self)).index!
    }
}

struct AOC12: Puzzle {
    typealias Answer = Int
    
    private func shortestPath(grid: [[Int]], startPoints: [Point], endPoint: Point) -> Int? {
        var visitQueue = startPoints
        var distanceByPoint = startPoints.reduce(into: [:]) { $0[$1] = 0 }
        
        while let curPoint = visitQueue.first, let curDistance = distanceByPoint[curPoint] {
            visitQueue.removeFirst()
            for nextPoint in curPoint.neighbors {
                guard let nextHeight = grid[nextPoint], let curHeight = grid[curPoint], nextHeight <= curHeight + 1 else { continue }
                if (curDistance + 1) < distanceByPoint[nextPoint, default: Int.max] {
                    distanceByPoint[nextPoint] = (curDistance + 1)
                    visitQueue.append(nextPoint)
                }
            }
        }
        
        return distanceByPoint[endPoint]
    }
    
    private func heightForCharacter(_ character: Character) -> Int {
        (character == "S" ? "a" : (character == "E" ? "z" : character)).index!
    }
    
    private func solve(input: String, startCharacters: [Character]) -> Int {
        let lines = input.lines.map { Array($0) }
        let grid = lines.map { $0.map(\.height) }
        
        var starts: [Point] = []
        var end: Point = .origin
        for point in product(0..<lines.count, 0..<lines[0].count).map({ Point($0.0, $0.1) }) {
            switch lines[point]! {
            case let x where startCharacters.contains(x):
                starts.append(point)
            case "E":
                end = point
            default:
                break
            }
        }
        return shortestPath(grid: grid, startPoints: starts, endPoint: end)!
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, startCharacters: ["S"])
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, startCharacters: ["S", "a"])
    }
}
