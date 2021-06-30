//
//  BaseNode.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import Foundation

struct BaseNode: Node {
    static var position: CGPoint = CGPoint()
    static var id = UUID()
    static var title: String = "Start"
}
