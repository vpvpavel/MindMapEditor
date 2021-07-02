//
//  BaseNode.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import Foundation
import CoreGraphics

public struct BaseNode: Node, Identifiable {
    public var id = UUID()
    public var position: CGPoint?
    public var title: String = ""
    public var sockets: [Socket] = []
}
