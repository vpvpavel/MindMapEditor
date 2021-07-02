//
//  MMEViewModel.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 7/1/21.
//

import Foundation

class MMEViewModel: ObservableObject {
    @Published var nodes: [BaseNode] = []
    @Published var selectedNode: BaseNode?
    
    public func selectNode(node: BaseNode) {
        selectedNode = node
    }
    
    public func createNode() {
        self.nodes.append(BaseNode(title: "New node",
                                   sockets:[
                                    Socket(type: .in, title: "Input"),
                                    Socket(type: .out, title: "Output")
                                   ]))
    }
}
