//  Tuple.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/20.
//

import Foundation

prefix func +<T : Numeric> (x: (T, T, T)) -> T {
    return x.0 + x.1 + x.2
}

func +<T : Numeric> (x: (T, T), y: (T, T)) -> (T, T) {
    return (x.0 + y.0, x.1 + y.1)
}

func +<T : Numeric> (x: (T, T, T), y: (T, T, T)) -> (T, T, T) {
    return (x.0 + y.0, x.1 + y.1, x.2 + y.2)
}

func +<T : Numeric> (x: (T, T, T, T), y: (T, T, T, T)) -> (T, T, T, T) {
    return (x.0 + y.0, x.1 + y.1, x.2 + y.2, x.3 + y.3)
}

func *<T : Numeric> (x: (T, T), y: (T, T)) -> (T, T) {
    return (x.0 * y.0, x.1 * y.1)
}

func *<T : Numeric> (x: (T, T, T), y: (T, T, T)) -> (T, T, T) {
    return (x.0 * y.0, x.1 * y.1, x.2 * y.2)
}

func *<T : Numeric> (x: (T, T, T, T), y: (T, T, T, T)) -> (T, T, T, T) {
    return (x.0 * y.0, x.1 * y.1, x.2 * y.2, x.3 * y.3)
}

extension String {
    func splitInTwo(_ separator: String) -> (String, String) {
        let comp = components(separatedBy: separator)
        if comp.count != 2 {
            fatalError("Attempting to split \(self) into a 2-tuple with separator \(separator)")
        }
        return (comp[0], comp[1])
    }
}
