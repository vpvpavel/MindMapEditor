//
//  UINodeSocketType.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import Foundation
import UIKit

class UINodeSocket: UIView {
    private(set) var type: NodeSocketType
    
    weak var node: UINode?
    
    var connectedSockets = [UINodeSocket]()
    
    var draggingTarget: CGPoint?
    
    private var shapeView: UIView = UIView()
    
    init(frame: CGRect, type: NodeSocketType, node: UINode) {
        self.type = type
        self.node = node
        
        super.init(frame: frame)
        
        // Style the view
        backgroundColor = .clear
        shapeView.layer.cornerRadius = 0
        
        // Add the shape view
        shapeView.backgroundColor = type.color
        addSubview(shapeView)
        shapeView.translatesAutoresizingMaskIntoConstraints = false
        shapeView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        shapeView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        shapeView.widthAnchor.constraint(equalToConstant: 22).activate()
        shapeView.heightAnchor.constraint(equalTo: shapeView.widthAnchor).activate()
        
        
        // Add a triangle
        //           self.triangleShape = addTriangle(size: CGSize(width: 6, height: 8))
        
        // Add variables text
        //           if case let .outputTrigger(trigger) = type, trigger.exposedVariables.count > 0 {
        //               let variablesText = UILabel()
        //               self.variablesText = variablesText
        //               variablesText.text = "0"//String(trigger.exposedVariables.count)
        //               variablesText.font = UIFont.codeFont(size: 10)
        //               variablesText.textAlignment = .center
        //               variablesText.isUserInteractionEnabled = false
        //               addSubview(variablesText)
        //               variablesText.translatesAutoresizingMaskIntoConstraints = false
        //               variablesText.widthAnchor.constraint(equalToConstant: 20).activate()
        //               variablesText.heightAnchor.constraint(equalToConstant: 20).activate()
        //               variablesText.rightAnchor.constraint(equalTo: rightAnchor).activate()
        //               variablesText.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
        //           }
        
        // Add drag gesture
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(sender:)))
        addGestureRecognizer(dragGesture)
        //
        //           // Update state
        //           updateState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func panned(sender: UIPanGestureRecognizer) {
        guard let node = node, let canvas = node.canvas else {
            print("Missing node or canvas for socket.")
            return
        }
        
        // Remove the target
        //        switch type {
        //        case .inputTrigger(let trigger): trigger.reset()
        //        case .outputTrigger(let trigger): trigger.reset()
        //        case .inputValue(let value): value.reset()
        //        case .outputValue(let value): value.reset()
        //        case .inputVariable(let variable): variable.reset()
        //        }
        
        // Update the dragging to position
        if sender.state == .began || sender.state == .changed {
            // Set the translation in this view; otherwise, it will start at 0
            // which is not what we want
            if draggingTarget == nil {
                sender.setTranslation(sender.location(ofTouch: 0, in: self), in: self)
            }
            
            // Save the translation
            draggingTarget = sender.translation(in: self)
        } else {
            // Finish the connection
            canvas.finishConnection(socket: self)
            
            // Remove the target
            draggingTarget = nil
        }
        
        // Notify updates
        updateState()
        canvas.updated(node: node)
    }
    
    func updateState() {
        let isConnected = self.draggingTarget != nil
        
        // Update shape layer
        UIView.animate(withDuration: 0.2) {
            self.shapeView.layer.cornerRadius = isConnected ? self.shapeView.frame.width / 2 : 8
        }
    }
    
    func canConnectTo(socket: UINodeSocket) -> Bool {
        return node != socket.node && type != socket.type
    }
    
    func connect(to socket: UINodeSocket) {
        connectedSockets.append(socket)
    }
}

