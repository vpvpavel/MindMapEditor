//
//  ViewController.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

public class CanvasViewController: UIViewController {
    
    /// Canvas that holds all of the nodes
    public let canvas: UICanvas
    var mesh: UIMesh
    var toolsPanel: UITool
    
    public init() {
        canvas = UICanvas(frame: CGRect.zero)
        mesh = UIMesh(frame: canvas.bounds)
        toolsPanel = UITool(frame: CGRect.zero)

        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(canvas)
        canvas.translatesAutoresizingMaskIntoConstraints = false
        canvas.leftAnchor.constraint(equalTo: view.leftAnchor).activate()
        canvas.rightAnchor.constraint(equalTo: view.rightAnchor).activate()
        canvas.topAnchor.constraint(equalTo: view.topAnchor).activate()
        canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        
        // Add background mesh
        
        canvas.backgroundView = mesh
        
        create(node: BranchNode(), position: view.center)
        
        view.addSubview(toolsPanel)

    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @discardableResult
    func create(node nodeType: Node, position: CGPoint) -> UINode? {
          // Create the node
          
          // Create and insert the display node
          let displayNode = UINode(node: nodeType)
          canvas.insert(node: displayNode, at: position)
          
          return displayNode
      }
}

