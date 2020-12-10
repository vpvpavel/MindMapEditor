//
//  UIMesh.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/9/20.
//

import UIKit

class UIMesh: UIView {
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         
         backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
