//
//  UITool.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

class UITool: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        button.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        
        backgroundColor = .white
    }
    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        // Size to fit content
        
        
    }
}
