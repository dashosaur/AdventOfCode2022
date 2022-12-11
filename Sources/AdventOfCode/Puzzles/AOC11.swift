//  AOC11.swift
//  AdventOfCode
//
//  Created by Dash on 12/10/22.
//

import Foundation

fileprivate struct Monkey {
    var inspectCount = 0
    var items: [Int]
    
    enum Operation {
        case add(_ x: Int)
        case multiply(_ x: Int)
        case square
        
        func perform(_ value: Int) -> Int {
            switch self {
            case .add(let x):
                return value + x
            case .multiply(let x):
                return value * x
            case .square:
                return value * value
            }
        }
    }
    
    let operation: Operation
    let divisor: Int
    let ifTrue: Int
    let ifFalse: Int
    
    func monkeyToThrow(item: Int) -> Int {
        item % divisor == 0 ? ifTrue : ifFalse
    }
    
    enum TurnMode {
        case relief(divisor: Int)
        case manageWorry(divisorProduct: Int)
    }
    
    /// Returns items by monkey to throw to
    mutating func performTurn(mode: TurnMode) -> [Int : [Int]] {
        var itemsByMonkeyIndex = [Int : [Int]]()
        for item in items {
            var updated = operation.perform(item)
            switch mode {
            case .relief(let divisor):
                updated /= divisor
            case .manageWorry(let divisorProduct):
                updated %= divisorProduct
            }
            itemsByMonkeyIndex[monkeyToThrow(item: updated), default: []] += [updated]
        }
        inspectCount += items.count
        items.removeAll()
        return itemsByMonkeyIndex
    }
}

struct AOC11: Puzzle {
    typealias Answer = Int
    
    fileprivate func solve(monkeys: [Monkey], rounds: Int, turnMode: Monkey.TurnMode) -> Int {
        var monkeys = monkeys
        for _ in 0..<rounds {
            for i in 0..<monkeys.count {
                for (monkeyIndex, newItems) in monkeys[i].performTurn(mode: turnMode) {
                    monkeys[monkeyIndex].items += newItems
                }
            }
        }
        return monkeys.map(\.inspectCount).max(count: 2).reduce(1, *)
    }
    
    func solve1(input: String) -> Int {
        solve(monkeys: Monkey.all, rounds: 20, turnMode: .relief(divisor: 3))
    }
    
    func solve2(input: String) -> Int {
        solve(monkeys: Monkey.all, rounds: 10_000, turnMode: .manageWorry(divisorProduct: Monkey.all.map(\.divisor).reduce(1, *)))
    }
}

extension Monkey {
    static let all: [Monkey] = [
        .init(items: [54, 89, 94], operation: .multiply(7), divisor: 17, ifTrue: 5, ifFalse: 3),
        .init(items: [66, 71], operation: .add(4), divisor: 3, ifTrue: 0, ifFalse: 3),
        .init(items: [76, 55, 80, 55, 55, 96, 78], operation: .add(2), divisor: 5, ifTrue: 7, ifFalse: 4),
        .init(items: [93, 69, 76, 66, 89, 54, 59, 94], operation: .add(7), divisor: 7, ifTrue: 5, ifFalse: 2),
        .init(items: [80, 54, 58, 75, 99], operation: .multiply(17), divisor: 11, ifTrue: 1, ifFalse: 6),
        .init(items: [69, 70, 85, 83], operation: .add(8), divisor: 19, ifTrue: 2, ifFalse: 7),
        .init(items: [89], operation: .add(6), divisor: 2, ifTrue: 0, ifFalse: 1),
        .init(items: [62, 80, 58, 57, 93, 56], operation: .square, divisor: 13, ifTrue: 6, ifFalse: 4),
    ]
}
