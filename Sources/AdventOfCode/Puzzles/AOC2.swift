//  AOC2.swift
//  AdventOfCode
//
//  Created by Dash on 12/1/22.
//

import Foundation

fileprivate enum Outcome: Int {
    case lose   = 0
    case draw   = 3
    case win    = 6
    
    init?(_ string: String) {
        switch string {
        case "X":
            self = .lose
        case "Y":
            self = .draw
        case "Z":
            self = .win
        default:
            return nil
        }
    }
}

fileprivate enum Shape: Int, CaseIterable {
    case rock       = 1
    case paper      = 2
    case scissors   = 3
    
    init?(_ string: String) {
        switch string {
        case "A", "X":
            self = .rock
        case "B", "Y":
            self = .paper
        case "C", "Z":
            self = .scissors
        default:
            return nil
        }
    }
    
    func outcome(against shape: Shape) -> Outcome {
        switch (rawValue - shape.rawValue + 3) % 3 {
        case 0:
            return .draw
        case 1:
            return .win
        case 2:
            return .lose
        default:
            fatalError()
        }
    }
}

struct AOC2: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        input.lines.reduceSum { line in
            let (c1, c2) = line.splitInTwo(" ")
            let shape1 = Shape(c1)!
            let shape2 = Shape(c2)!
            return shape2.outcome(against: shape1).rawValue + shape2.rawValue
        }
    }
    
    func solve2(input: String) -> Int {
        input.lines.reduceSum { line in
            let (c1, c2) = line.splitInTwo(" ")
            let shape1 = Shape(c1)!
            let outcome = Outcome(c2)!
            let shape2 = Shape.allCases.first(where: { $0.outcome(against: shape1) == outcome })!
            return outcome.rawValue + shape2.rawValue
        }
    }
}
