//  stride.swift
//  AdventOfCode
//
//  Created by Dash on 12/4/21.
//

import Foundation

@inlinable public func stride<T>(from start: T, through end: T) -> StrideThrough<T> where T : Strideable {
    if start > end {
        return stride(from: start, through: end, by: -1)
    } else {
        return stride(from: start, through: end, by: 1)
    }
}
