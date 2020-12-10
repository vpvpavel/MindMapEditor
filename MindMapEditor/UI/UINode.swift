//
//  UINode.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

public class UINode: UIView, UIGestureRecognizerDelegate {
    
    public var contentView: UINodeContentView?
    
    /// Canvas that this node is displayed in.
    weak var canvas: UICanvas?
    
    /// List of all sockets on the node.
    var sockets: [UINodeSocket] = []
    
    public init(node: Node) {
        super.init(frame: CGRect(x: 0, y: 0, width: 99999, height: 9999)) // Need large frame so the layout can be made
        
        // Setup the view
        backgroundColor = UIColor(white: 0, alpha: 0.3)
        layer.cornerRadius = 8
        
        // Add label
        let titleNode = UILabel(frame: CGRect.zero)
        titleNode.textAlignment = .center
        titleNode.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        titleNode.text = type(of: node).title
        titleNode.textColor = .white
        addSubview(titleNode)
        
        titleNode.translatesAutoresizingMaskIntoConstraints = false
        titleNode.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        titleNode.topAnchor.constraint(equalTo: topAnchor, constant: 8).activate()
        titleNode.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 10).activate()
        titleNode.rightAnchor.constraint(greaterThanOrEqualTo: rightAnchor, constant: -10).activate()
        
        // Add content view
        let panelBottomAnchor = bottomAnchor // Anchor to attatch the panels to
        
        // Create panels
        let leftPanel = UIStackView(frame: CGRect.zero)
        leftPanel.axis = .vertical
        leftPanel.alignment = .leading
        leftPanel.distribution = .fill
        addSubview(leftPanel)
        
        leftPanel.translatesAutoresizingMaskIntoConstraints = false
        leftPanel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).activate()
        leftPanel.topAnchor.constraint(equalTo: titleNode.bottomAnchor, constant: 8).activate()
        leftPanel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).activate()
        leftPanel.bottomAnchor.constraint(lessThanOrEqualTo: panelBottomAnchor, constant: -8).activate()
        
        let rightPanel = UIStackView(frame: CGRect.zero)
        rightPanel.axis = .vertical
        rightPanel.alignment = .trailing
        rightPanel.distribution = .fill
        addSubview(rightPanel)
        
        rightPanel.translatesAutoresizingMaskIntoConstraints = false
        rightPanel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).activate()
        rightPanel.topAnchor.constraint(equalTo: titleNode.bottomAnchor, constant: 8).activate()
        rightPanel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).activate()
        rightPanel.bottomAnchor.constraint(lessThanOrEqualTo: panelBottomAnchor, constant: -8).activate()
        
        leftPanel.rightAnchor.constraint(equalTo: rightPanel.leftAnchor, constant: -8).activate()
        
        // stub property
        addProperty(parent: leftPanel, leftAlign: true, socket: .in, name: "Input", type: ">")
        
        addProperty(parent: rightPanel, leftAlign: false, socket: .out, name: "Output", type: ">")
        addProperty(parent: rightPanel, leftAlign: false, socket: .out, name: "Output", type: ">")
        
        
        // Add drag gesture
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(sender:)))
        dragGesture.delegate = self
        addGestureRecognizer(dragGesture)
        
        // Add intro effect
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        transform = CGAffineTransform(scaleX: 0, y: 0)
        alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        // Size to fit content
        frame.size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    @objc func panned(sender: UIPanGestureRecognizer) {
        // Handle movement
        if sender.state == .began || sender.state == .changed {
            // Drag the view
            let translation = sender.translation(in: self)
            center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self)
            // Update canvas with connections
            canvas?.updated(node: self)
        }
    }
    
    func addProperty(parent: UIStackView,
                     leftAlign: Bool,
                     socket socketType: UINodeSocketType,
                     name: String,
                     type: String?) {
        
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let socket = UINodeSocket(frame: CGRect.zero, type: socketType, node: self)
        sockets.append(socket) // Save the socket
        view.addSubview(socket)
        socket.translatesAutoresizingMaskIntoConstraints = false
        socket.topAnchor.constraint(equalTo: view.topAnchor).activate()
        socket.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
        socket.widthAnchor.constraint(equalTo: socket.heightAnchor).activate()
        
        let socketName = UILabel(frame: CGRect.zero)
        socketName.text = name
        view.addSubview(socketName)
        socketName.translatesAutoresizingMaskIntoConstraints = false
        socketName.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).activate() // Make the view's height dependent on font size
        socketName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).activate() // ^
        socketName.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
        
        let typeLabel = UILabel(frame: CGRect.zero)
        typeLabel.text = type
        typeLabel.textColor = .white
        typeLabel.font = UIFont.codeFont()
        view.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
        
        // Add constraints to align the views horizontally
        var alignedViews = [socket, socketName, typeLabel]
        if !leftAlign {
            alignedViews = alignedViews.reversed()
        }
        if leftAlign {
            alignedViews.first?.leftAnchor.constraint(equalTo: view.leftAnchor).activate()
            alignedViews.last?.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor, constant: -8).activate()
        } else {
            alignedViews.first?.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 8).activate()
            alignedViews.last?.rightAnchor.constraint(equalTo: view.rightAnchor).activate()
        }
        for i in 1..<alignedViews.count {
            alignedViews[i].leftAnchor.constraint(equalTo: alignedViews[i-1].rightAnchor, constant: 8).activate()
        }
        
        parent.addArrangedSubview(view)
    }
}
