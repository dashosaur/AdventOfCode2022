//  AOC15.swift
//  AdventOfCode
//
//  Created by Dash on 12/14/22.
//

import Foundation

fileprivate struct IntegerSet {
    private var positives = IndexSet()
    private var negatives = IndexSet()
    
    mutating func insert(integersIn range: ClosedRange<Int>) {
        let lower = range.lowerBound
        let upper = range.upperBound
        if upper >= 0 {
            positives.insert(integersIn: max(0, lower)...upper)
        }
        if lower < 0 {
            negatives.insert(integersIn: max(1, -upper)...(-lower))
        }
    }
    
    mutating func remove(_ integer: Int) {
        if integer < 0 {
            negatives.remove(-integer)
        } else {
            positives.remove(integer)
        }
    }
    
    var ranges: [ClosedRange<Int>] {
        negatives.rangeView.map { (-($0.upperBound - 1))...(-$0.lowerBound) }
        +
        positives.rangeView.map { $0.lowerBound...($0.upperBound - 1) }
    }
    
    var count: Int {
        positives.count + negatives.count
    }
}

fileprivate struct Sensor {
    let location: Point
    let nearestBeacon: Point
    let coverageDistance: Int
    
    init(location: Point, nearestBeacon: Point) {
        self.location = location
        self.nearestBeacon = nearestBeacon
        self.coverageDistance = location.manhattanDistance(to: nearestBeacon)
    }
    
    init(_ input: String) {
        let components = input.components(separatedBy: " ")
        self = Sensor(location: Point(Int(components[2].dropFirst(2).dropLast(1))!,
                                      Int(components[3].dropFirst(2).dropLast(1))!),
                      nearestBeacon: Point(Int(components[8].dropFirst(2).dropLast(1))!,
                                           Int(components[9].dropFirst(2))!))
    }
    
    func xCoverage(atY y: Int) -> ClosedRange<Int>? {
        let yDistance = abs(location.y - y)
        guard yDistance <= coverageDistance else { return nil }
        let xDistance = coverageDistance - yDistance
        return (location.x - xDistance)...(location.x + xDistance)
    }
}

fileprivate extension [Sensor] {
    func xCoverage(atY y: Int) -> IntegerSet {
        reduce(into: IntegerSet()) {
            if let xRange = $1.xCoverage(atY: y) {
                $0.insert(integersIn: xRange)
            }
        }
    }
}

struct AOC15: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String, y: Int) -> Int {
        let sensors = input.lines.map { Sensor($0) }
        var xCoverage = sensors.xCoverage(atY: y)
        for beacon in sensors.map(\.nearestBeacon) where beacon.y == y {
            xCoverage.remove(beacon.x)
        }
        return xCoverage.count
    }
    
    func solve1(input: String) -> Int {
        solve1(input: input, y: 2000000)
    }
    
    func solve2(input: String, max: Int) -> Int {
        let sensors = input.lines.map { Sensor($0) }
        
        for y in 0...max {
            let xCoverage = sensors.reduce(into: IntegerSet()) { xCoverage, sensor in
                if let xc = sensor.xCoverage(atY: y) {
                    xCoverage.insert(integersIn: xc.clamped(to: 0...max))
                }
            }
            if xCoverage.count != max + 1 {
                return (xCoverage.ranges.first!.upperBound + 1) * 4000000 + y
            }
        }
        return -1
    }
    
    func solve2(input: String) -> Int {
        solve2(input: input, max: 4000000)
    }
}
