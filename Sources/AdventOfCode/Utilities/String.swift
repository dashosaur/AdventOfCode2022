//  String.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/20.
//

import Foundation

// MARK: - String Splitting

extension String {
    func components(seperatedByCharactersIn characterSetString: String) -> [String] {
        components(separatedBy: CharacterSet(charactersIn: characterSetString)).filter { $0 != "" }
    }
    
    var componentStrings: [String] {
        components(seperatedByCharactersIn: ", \n").filter { $0 != "" }
    }
    
    var lines: [String] {
        components(seperatedByCharactersIn: "\n").filter { $0 != "" }
    }
    
    var lineGroups: [String] {
        components(separatedBy: "\n\n").filter { $0 != "" }
    }
    
    var lineWidth: Int {
        lines.first!.count
    }
}

// MARK: - Value Parsing

extension String {
    var integers: [Int] {
        componentStrings.map { string in
            if let value = Int(string) { return value }
            fatalError("Cannot convert \(string) to Int")
        }
    }
    
    var digitArray: [Int] {
        self.map { char in
            if let value = Int(String(char)) { return value }
            fatalError("Cannot convert \(char) to Int")
        }
    }
    
    var range: ClosedRange<Int> {
        let values = components(separatedBy: "-")
        return Int(values[0])!...Int(values[1])!
    }
    
    var doubles: [Double] {
        componentStrings.map { string in
            if let value = Double(string) { return value }
            fatalError("Cannot convert \(string) to Double")
        }
    }
    
    var points: [CGPoint] {
        lines.map { string in
            let items = string.components(seperatedByCharactersIn: ", ")
            guard items.count == 2 else {
                fatalError("Cannot convert \(string) to CGPoint, count = \(items.count)")
            }
            guard let x = Double(items[0]), let y = Double(items[1]) else {
                fatalError("Cannot convert \(string) to CGPoint, items = \(items)")
            }
            return CGPoint(x: x, y: y)
        }
    }
}

// MARK: - Characters

extension String {
    func count(of character: Character) -> Int {
        reduce(0) { $0 + ($1 == character ? 1 : 0) }
    }
    
    mutating func removeAndReturnFirst(_ k: Int) -> String {
        let sub = self[0..<k]
        removeFirst(k)
        return String(sub)
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(range: Range<Int>) -> String {
        String(self[index(startIndex, offsetBy: range.startIndex)..<index(startIndex, offsetBy: range.endIndex)])
    }
    
    func char(at offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

// MARK: - Replacing

extension String {
    func replacingFirst(of target: String, with replacement: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replacement)
        } else {
            return self
        }
    }
    
    func removingOccurrences(of strings: [String]) -> String {
        strings.reduce(self) { $0.removingOccurrences(of: $1) }
    }
    
    func removingOccurrences(of string: String) -> String {
        replacingOccurrences(of: string, with: "")
    }
    
    func removingCharacters(in string: String) -> String {
        var copy = self
        copy.removeAll(where: { string.contains($0) })
        return copy
    }
}

// MARK: - Binary

extension String {
    init(_ int: Int, radix: Int, length: Int) {
        self = String(int, radix: radix).leftPadding(toLength: length, withPad: "0")
    }
    
    func binaryToDecimal() -> Int {
        if let b = Int(self, radix: 2) {
            return b
        } else {
            fatalError("Cannot convert \(self) to binary")
        }
    }
    
    func leftPadding(toLength length: Int, withPad character: Character) -> String {
        String(repeatElement(character, count: max(length - count, 0))) + self
    }
    
    func hexToBinary() -> String {
        map({ $0.isNewline ? "" : String(Int("\($0)", radix: 16)!, radix: 2, length: 4) }).joined()
    }
}

// MARK: - Printing

extension String {
    func indentLevel(_ level: Int) -> String {
        "\(repeatElement("\t", count: level).joined())\(self)"
    }
}
