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
    
    func testAOC8() {
        let puzzle = AOC8()
        let input = """
        30373
        25512
        65332
        33549
        35390
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 21)
        XCTAssertEqual(puzzle.solve2(input: input), 8)
    }
    
    func testAOC9() {
        let puzzle = AOC9()
        let input = """
        R 4
        U 4
        L 3
        D 1
        R 4
        D 1
        L 5
        R 2
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 13)
        XCTAssertEqual(puzzle.solve2(input: input), 1)
        
        let input2 = """
        R 5
        U 8
        L 8
        D 3
        R 17
        D 10
        L 25
        U 20
        """
        
        XCTAssertEqual(puzzle.solve2(input: input2), 36)
    }
    
    func testAOC10() {
        let puzzle = AOC10()
        let input = """
        addx 15
        addx -11
        addx 6
        addx -3
        addx 5
        addx -1
        addx -8
        addx 13
        addx 4
        noop
        addx -1
        addx 5
        addx -1
        addx 5
        addx -1
        addx 5
        addx -1
        addx 5
        addx -1
        addx -35
        addx 1
        addx 24
        addx -19
        addx 1
        addx 16
        addx -11
        noop
        noop
        addx 21
        addx -15
        noop
        noop
        addx -3
        addx 9
        addx 1
        addx -3
        addx 8
        addx 1
        addx 5
        noop
        noop
        noop
        noop
        noop
        addx -36
        noop
        addx 1
        addx 7
        noop
        noop
        noop
        addx 2
        addx 6
        noop
        noop
        noop
        noop
        noop
        addx 1
        noop
        noop
        addx 7
        addx 1
        noop
        addx -13
        addx 13
        addx 7
        noop
        addx 1
        addx -33
        noop
        noop
        noop
        addx 2
        noop
        noop
        noop
        addx 8
        noop
        addx -1
        addx 2
        addx 1
        noop
        addx 17
        addx -9
        addx 1
        addx 1
        addx -3
        addx 11
        noop
        noop
        addx 1
        noop
        addx 1
        noop
        noop
        addx -13
        addx -19
        addx 1
        addx 3
        addx 26
        addx -30
        addx 12
        addx -1
        addx 3
        addx 1
        noop
        noop
        noop
        addx -9
        addx 18
        addx 1
        addx 2
        noop
        noop
        addx 9
        noop
        noop
        noop
        addx -1
        addx 2
        addx -37
        addx 1
        addx 3
        noop
        addx 15
        addx -21
        addx 22
        addx -6
        addx 1
        noop
        addx 2
        addx 1
        noop
        addx -10
        noop
        noop
        addx 20
        addx 1
        addx 2
        addx 2
        addx -6
        addx -11
        noop
        noop
        noop
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 13140)
        XCTAssertEqual(puzzle.solve2(input: input), 6131564884249)
    }
    
    func testAOC11() {
        let puzzle = AOC11()
        XCTAssertEqual(puzzle.solve1(input: ""), 110888)
        XCTAssertEqual(puzzle.solve2(input: ""), 25590400731)
    }
    
    func testAOC12() {
        let puzzle = AOC12()
        let input = """
        Sabqponm
        abcryxxl
        accszExk
        acctuvwj
        abdefghi
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 31)
        XCTAssertEqual(puzzle.solve2(input: input), 29)
    }
    
    func testAOC13() {
        let puzzle = AOC13()
        let input = """
        [1,1,3,1,1]
        [1,1,5,1,1]

        [[1],[2,3,4]]
        [[1],4]

        [9]
        [[8,7,6]]

        [[4,4],4,4]
        [[4,4],4,4,4]

        [7,7,7,7]
        [7,7,7]

        []
        [3]

        [[[]]]
        [[]]

        [1,[2,[3,[4,[5,6,7]]]],8,9]
        [1,[2,[3,[4,[5,6,0]]]],8,9]
        """
        
        XCTAssertEqual(puzzle.solve1(input: input), 13)
        XCTAssertEqual(puzzle.solve2(input: input), 140)
    }
}
