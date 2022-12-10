//  AOC10.swift
//  AdventOfCode
//
//  Created by Dash on 12/9/22.
//

import Foundation

struct AOC10: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let interestingCycles: Set<Int> = [20, 60, 100, 140, 180, 220]
        
        var x = 1
        var cycle = 0
        var signalStrengthSum = 0
        
        func performCycle() {
            cycle += 1
            
            if interestingCycles.contains(cycle) {
                signalStrengthSum += cycle * x
            }
        }
        
        for line in input.lines {
            if line == "noop" {
                performCycle()
            } else {
                performCycle()
                performCycle()
                x += Int(line.split(separator: " ")[1])!
            }
        }
        
        return signalStrengthSum
    }
    
    func solve2(input: String) -> Int {
        var pixels = Array(repeatElement(false, count: 240))
        
        var x = 1
        var cycle = 0
        
        func performCycle() {
            if ((x - 1)...(x + 1)).contains(cycle % 40) {
                pixels[cycle] = true
            }
            
            cycle += 1
        }
        
        for line in input.lines {
            if line == "noop" {
                performCycle()
            } else {
                performCycle()
                performCycle()
                x += Int(line.split(separator: " ")[1])!
            }
        }
        
        var pixelSum = 0 // Sum each image row as binary int just to have a simple value to unit test against
        for chunk in pixels.chunks(ofCount: 40) {
            print(String(chunk.map({ $0 ? "⚪️" : "⬛️" })))
            pixelSum += Int(String(chunk.map({ $0 ? "1" : "0" })), radix: 2)!
        }
        return pixelSum
    }
}
