//
//  UICanvas.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

public class UICanvas: UIScrollView, UIScrollViewDelegate {
    
    /// List of all nodes in the canvas.
    public private(set) var nodes: [UINode]
        
    /// View that is drawn behind all other views.
    var backgroundView: UIView? {
        didSet {
            // Remove the old value
            oldValue?.removeFromSuperview()
            
            // Add the new vlaue
            if let backgroundView = backgroundView {
                addSubview(backgroundView)
                sendSubviewToBack(backgroundView)
            }
        }
    }
    
    /// View that overlays the canvas and draws connections between nodes.
    private var overlayView: UICanvasOverlay!
    
    override init(frame: CGRect) {
        nodes = []
        super.init(frame: frame)
        
        // Configure the scroll view to be large & only allow panning with two
        // touches
        delegate = self
        decelerationRate = UIScrollView.DecelerationRate.fast
        contentSize = CGSize(width: 10000, height: 10000)
        for recognizer in gestureRecognizers ?? [] {
            if let recognizer = recognizer as? UIPanGestureRecognizer {
                // Only allow scrolling with two fingers
                recognizer.minimumNumberOfTouches = 2
                recognizer.maximumNumberOfTouches = 2
            }
        }
        
        // Style the view
        clipsToBounds = true
        backgroundColor = .clear
        
        // Add the overlay
        overlayView = UICanvasOverlay(frame: bounds, canvas: self)
        addSubview(overlayView)
        
//        let node = UINode(node: BaseNode())
//        insert(node: node, at: CGPoint(x: contentSize.width / 2, y: contentSize.height / 2))
        
        // Scroll to the center
        contentOffset = CGPoint(x: contentSize.width / 2 - 200, y: contentSize.height / 2 - 200)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Adds a node to the canvas.
    public func insert(node: UINode, at position: CGPoint, absolutePosition: Bool = false) {
        assert(!nodes.contains(node))
        assert(node.canvas == nil)
        
        // Set the canvas
        node.canvas = self
        
        // Insert into the list and view
        nodes.append(node)
        addSubview(node)
        
        // Position the node
        node.layoutIfNeeded()
        node.center = position
        if !absolutePosition {
            node.frame.origin.x += contentOffset.x
            node.frame.origin.y += contentOffset.y
        }
        
        // Perform updated
        updated(node: node)
    }
    
    public override func layoutSubviews() {
        // Resize all views
        backgroundView?.frame.size = bounds.size
        overlayView.frame.size = bounds.size
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Move the background and overlay with the view
        backgroundView?.frame.origin = scrollView.contentOffset
        overlayView.frame.origin = scrollView.contentOffset
        
        // Update overlay
//        updateState()
    }
    
    public func updated(node: UINode) {
          // Bring node to front under overlay
        bringSubviewToFront(node)
        bringSubviewToFront(overlayView)
          
          // Update this canvas' state
          updateState()
          
          // Update the state
//          node.updateState()
          
          // Call update
//          updateCallback?()
      }
    
    func updateState() {
        // Update overlay
        overlayView.setNeedsDisplay()
        
        // This does not notify the child node's state, since that's an
        // expensive operatino and should rarely update all at once.
    }
    
    func finishConnection(socket: UINodeSocket) {
           guard let target = socket.draggingTarget else {
               print("No target for socket.")
               return
           }
           
           // Find a socket dislplay that matches the point
           nodeLoop: for node in nodes {
               if node.point(inside: node.convert(target, from: socket), with: nil) {
                   for targetSocket in node.sockets {
                       if targetSocket.point(inside: targetSocket.convert(target, from: socket), with: nil) {
                           // Attempt to connect the sockets
                           if socket.canConnectTo(socket: targetSocket) {
                               socket.connect(to: targetSocket)
                               break nodeLoop
                           }
                       }
                   }
               }
           }
           
           // Remove the target
           socket.draggingTarget = nil
           
           // Update
//           updateCallback?()
       }
}
