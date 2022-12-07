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
    
    func testAOC4() {
        let puzzle = AOC4()
        let input = """
        2-4,6-8
        2-3,4-5
        5-7,7-9
        2-8,3-7
        6-6,4-6
        2-6,4-8
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 2)
        XCTAssertEqual(puzzle.solve2(input: input), 4)
    }
    
    func testAOC5() {
        let puzzle = AOC5()
        let input = """
            [D]
        [N] [C]
        [Z] [M] [P]
         1   2   3

        move 1 from 2 to 1
        move 3 from 1 to 3
        move 2 from 2 to 1
        move 1 from 1 to 2
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), "CMZ")
        XCTAssertEqual(puzzle.solve2(input: input), "MCD")
    }
    
    func testAOC6() {
        let puzzle = AOC6()
        let input = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
        
        XCTAssertEqual(puzzle.solve1(input: input), 7)
        XCTAssertEqual(puzzle.solve2(input: input), 19)
    }
    
    func testAOC7() {
        let puzzle = AOC7()
        let input = """
        $ cd /
        $ ls
        dir a
        14848514 b.txt
        8504156 c.dat
        dir d
        $ cd a
        $ ls
        dir e
        29116 f
        2557 g
        62596 h.lst
        $ cd e
        $ ls
        584 i
        $ cd ..
        $ cd ..
        $ cd d
        $ ls
        4060174 j
        8033020 d.log
        5626152 d.ext
        7214296 k
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 95437)
        XCTAssertEqual(puzzle.solve2(input: input), 24933642)
    }
    
}
