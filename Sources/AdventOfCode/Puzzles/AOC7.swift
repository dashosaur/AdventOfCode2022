//  AOC7.swift
//  AdventOfCode
//
//  Created by Dash on 12/6/22.
//

import Foundation
import Algorithms

fileprivate enum FileSystemNode {
    case file(size: Int)
    case directory(folder: FileSystemFolder)
    
    @discardableResult
    func totalSize(applying operation: ((Int) -> Void)? = nil) -> Int {
        switch self {
        case .directory(let folder):
            return folder.totalSize(applying: operation)
        case .file(let size):
            return size
        }
    }
}

fileprivate class FileSystemFolder {
    let name: String
    let parent: FileSystemFolder?
    var children: [FileSystemNode]
    
    init(name: String, parent: FileSystemFolder?, children: [FileSystemNode]) {
        self.name = name
        self.parent = parent
        self.children = children
    }
    
    @discardableResult
    func totalSize(applying operation: ((Int) -> Void)? = nil) -> Int {
        let size = children.reduceSum { $0.totalSize(applying: operation) }
        operation?(size)
        return size
    }
}

struct AOC7: Puzzle {
    typealias Answer = Int
    
    private func parseFolders(input: String) -> FileSystemFolder {
        var curFolder: FileSystemFolder!
        var root: FileSystemFolder!
        
        for line in input.lines {
            if line == "$ cd /" {
                guard root == nil else { fatalError() }
                root = FileSystemFolder(name: "/", parent: nil, children: [])
                curFolder = root
            } else if line.starts(with: "$ cd") {
                let dir = line.dropFirst(5)
                if dir == ".." {
                    curFolder = curFolder.parent
                } else {
                    for child in curFolder.children {
                        switch child {
                        case .file:
                            break
                        case .directory(let folder):
                            if folder.name == dir {
                                curFolder = folder
                            }
                        }
                    }
                }
            } else if line.starts(with: "$ ls") {
                // Do nothing, will parse list on upcoming lines
            } else {
                let dirOrSize = String(line.split(separator: " ")[0])
                let name = String(line.split(separator: " ")[1])
                
                var children = curFolder.children
                if dirOrSize == "dir" {
                    children.append(.directory(folder: .init(name: name, parent: curFolder, children: [])))
                } else {
                    children.append(.file(size: Int(dirOrSize)!))
                }
                curFolder.children = children
            }
        }
        
        return root
    }
    
    func solve1(input: String) -> Int {
        let root = parseFolders(input: input)
        
        var totalSizeOfSmallDir = 0
        root.totalSize { totalSizeOfSmallDir += $0 < 100_000 ? $0 : 0 }
        return totalSizeOfSmallDir
    }
    
    func solve2(input: String) -> Int {
        let root = parseFolders(input: input)
        let totalSizeUsed = root.totalSize()
        let minSizeToDelete = totalSizeUsed - 40000000
        
        var minEligibleFolderSize: Int? = nil
        root.totalSize { folderSize in
            guard folderSize > minSizeToDelete else { return }
            if let minFolderSize = minEligibleFolderSize {
                minEligibleFolderSize = min(minFolderSize, folderSize)
            } else {
                minEligibleFolderSize = folderSize
            }
        }
        return minEligibleFolderSize!
    }
}
