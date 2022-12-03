//
//  PuzzleTests.swift
//  AdventOfCodeTests
//
//  Created by Dash on 11/29/20.
//

import XCTest

class PuzzleTests: XCTestCase {

    func testExample() {
        XCTAssertEqual(Example().solve1(input: "12,16"), 5)
        XCTAssertEqual(Example().solve2(input: "100756"), 50346)
    }
    
    func testAOC1() {
        let puzzle = AOC1()
        let input = """
        1000
        2000
        3000
        
        4000
        
        5000
        6000
        
        7000
        8000
        9000
        
        10000
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 24000)
        XCTAssertEqual(puzzle.solve2(input: input), 45000)
    }
    
    func testAOC2() {
        let puzzle = AOC2()
        let input = """
        A Y
        B X
        C Z
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 15)
        XCTAssertEqual(puzzle.solve2(input: input), 12)
    }
    
    func testAOC3() {
        let puzzle = AOC3()
        let input = """
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 157)
        XCTAssertEqual(puzzle.solve2(input: input), 70)
    }
    
}
