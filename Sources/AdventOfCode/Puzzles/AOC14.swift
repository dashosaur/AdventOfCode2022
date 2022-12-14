//  AOC14.swift
//  AdventOfCode
//
//  Created by Dash on 12/13/22.
//

import Foundation
import Algorithms

fileprivate func min(_ point1: Point, _ point2: Point) -> Point {
    Point(min(point1.x, point2.x), min(point1.y, point2.y))
}

fileprivate func max(_ point1: Point, _ point2: Point) -> Point {
    Point(max(point1.x, point2.x), max(point1.y, point2.y))
}

struct AOC14: Puzzle {
    typealias Answer = Int
    
    private enum Tile: String {
        case air    = "."
        case rock   = "#"
        case sand   = "o"
    }
    
    private func printGrid(grid: [[Tile]]) {
        for y in 0..<grid[0].count {
            print(String((0..<grid.count).flatMap({ grid[$0][y].rawValue })))
        }
    }
    
    private func solve(input: String, addFloor: Bool) -> Int {
        var grid = Array(repeating: Array(repeating: Tile.air, count: 10000), count: 10000)
        
        var minPoint = Point(Int.max, Int.max)
        var maxPoint = Point(Int.min, Int.min)
        for line in input.lines {
            let points = line.split(separator: " -> ").map({ Point(String($0)) })
            for point in points {
                minPoint = min(minPoint, point)
                maxPoint = max(maxPoint, point)
            }
            for (p1, p2) in zip(points, points.dropFirst()) {
                if p1.x == p2.x {
                    for y in ClosedRange(bound1: p1.y, bound2: p2.y) {
                        grid[p1.x][y] = .rock
                    }
                } else if p1.y == p2.y {
                    for x in ClosedRange(bound1: p1.x, bound2: p2.x) {
                        grid[x][p1.y] = .rock
                    }
                } else {
                    fatalError()
                }
            }
        }
        let floorY = maxPoint.y + 2
        
        if addFloor {
            for x in 0..<10000 {
                grid[x][floorY] = .rock
            }
        }
        
        func findLandingLocation(from point: Point) -> Point? {
            guard grid[point.x][point.y] == .air else { return nil }
            var point = point
            while grid[point.x][point.y + 1] == .air, point.y <= floorY {
                point.y += 1
            }
            guard (0...floorY).contains(point.y) else { return nil }
            
            if let next = [point + Point(-1, 1), point + Point(1, 1)].first(where: { grid[$0.x][$0.y] == .air }) {
                return findLandingLocation(from: next)
            } else {
                return point
            }
        }
        
        var count = 0
        while let landing = findLandingLocation(from: Point(500, 0)) {
            grid[landing.x][landing.y] = .sand
            count += 1
        }
        
        return count
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, addFloor: false)
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, addFloor: true)
    }
}
