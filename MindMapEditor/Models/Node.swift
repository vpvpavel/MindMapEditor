//
//  Node.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import Foundation
import CoreGraphics

public struct Socket {
    var type: NodeSocketType
    var title = ""
}

public protocol Node {
    var title: String { get }
    var position: CGPoint? { get }
    var sockets: [Socket] { get }
}
