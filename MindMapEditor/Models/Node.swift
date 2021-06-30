//
//  Node.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import Foundation

public struct Connection {
    
}

public protocol Node {
    static var title: String { get }
    static var position: CGPoint { get }
    var input: Connection? { get }
    var output: [Connection] { get }
}


extension Node {
    public var input: Connection? { return nil }
    public var output: [Connection] { return [] }
}
