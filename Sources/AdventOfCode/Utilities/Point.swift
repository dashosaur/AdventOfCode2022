//  Point.swift
//  AdventOfCode
//
//  Created by Dash on 12/11/20.
//

import Foundation

infix operator %%: MultiplicationPrecedence
func %%<T: BinaryInteger>(lhs: T, rhs: T) -> T {
    return (lhs % rhs + rhs) % rhs
}

struct Point: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ string: String) {
        let split = string.split(separator: ",")
        self.x = Int(split[0])!
        self.y = Int(split[1])!
    }
    
    static let origin = Point(0, 0)
    
    static let unitVectors = [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)]
    
    var neighbors: [Point] {
        Self.unitVectors.map { self + $0 }
    }
    
    static func +(lhs: Point, rhs: Point) -> Point {
        Point(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    static func += (lhs: inout Point, rhs: Point) {
        lhs = lhs + rhs
    }
    
    static func -(lhs: Point, rhs: Point) -> Point {
        Point(lhs.x - rhs.x, lhs.y - rhs.y)
    }
    
    static func -= (lhs: inout Point, rhs: Point) {
        lhs = lhs - rhs
    }
    
    static func *(value: Int, point: Point) -> Point {
        Point(point.x * value, point.y * value)
    }
    
    func rotate(turns: Int) -> Point {
        (0..<(turns %% 4)).reduce(self) { p, _ in Point(p.y, -p.x) }
    }
    
    var manhattanDistance: Int {
        abs(x) + abs(y)
    }
}

extension Collection where Index == Int, Element : Collection, Element.Index == Int {
    subscript(point: Point) -> Element.Element? {
        guard (0..<count).contains(point.x) else { return nil }
        guard (0..<self[point.x].count).contains(point.y) else { return nil }
        return self[point.x][point.y]
    }
}
