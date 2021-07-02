//
//  Canvas.swift
//  MindMapEditor
//
//  Created by Pavlo on 25.01.2021.
//

import UIKit
import SwiftUI

struct CanvasRepresentable: UIViewRepresentable {
    @EnvironmentObject var viewModel: MMEViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let canvas = UICanvas()
        update(canvas)
        return canvas
    }
     
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let canvas = uiView as? UICanvas else {
            return
        }
        update(canvas)
    }
    
    private func update(_ canvas: UICanvas) {
        for node in viewModel.nodes {
            let displayNode = UINode(node: node)
            if !canvas.nodes.contains(where: { $0.nodeId == displayNode.nodeId }) {
                canvas.insert(node: displayNode, at: canvas.center)
            }
        }
    }
}
