//  Collection.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/20.
//

import Foundation

extension Sequence {
    func count(where predicate: (Element) -> Bool) -> Int {
        reduce(0) { predicate($1) ? $0 + 1 : $0 }
    }
    
    func reduceSum(_ valueForElement: (Element) -> Int) -> Int {
        reduce(0) { $0 + valueForElement($1) }
    }
    
    func reduceProduct(_ valueForElement: (Element) -> Int) -> Int {
        reduce(1) { $0 * valueForElement($1) }
    }
    
    func reduceMaximum(_ valueForElement: (Element) -> Int) -> Int {
        reduce(Int.min) {
            let value = valueForElement($1)
            return value > $0 ? value : $0
        }
    }
    
    func minimum(_ valueForElement: (Element) -> Int) -> Int {
        reduce(Int.max) {
            let value = valueForElement($1)
            return value < $0 ? value : $0
        }
    }
    
    func minimumMaximum(_ valueForElement: (Element) -> (Int)) -> (Int, Int) {
        reduce((Int.max, Int.min)) {
            let value = valueForElement($1)
            return (value < $0.0 ? value : $0.0, value > $0.1 ? value : $0.1)
        }
    }
}

extension Sequence where Element == Int {
    func minimumMaximum() -> (Int, Int) {
        minimumMaximum { $0 }
    }
    
    var sum: Int {
        reduceSum { $0 }
    }
}

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

extension Array where Element == [Int] {
    func value(at point: Point) -> Int? {
        if let row = self[safe: point.y] {
            return row[safe: point.x]
        } else {
            return nil
        }
    }
}

extension Set {
    func inserting(_ member: Element) -> Set {
        var copy = self
        copy.insert(member)
        return copy
    }
    
    func removing(_ member: Element) -> Set {
        var copy = self
        copy.remove(member)
        return copy
    }
}
