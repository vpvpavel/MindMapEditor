//
//  SocketType.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 6/30/21.
//

import Foundation
import UIKit

enum NodeSocketType {
    case `in`
    case out
    
    var color: UIColor {
        switch self {
        case .in:
            return .green
        case .out:
            return .lightGray
        }
    }

    var connectionColor: UIColor { return UIColor(white: 0.7, alpha: 0.8) }
    
    var isInput: Bool {
        switch self {
        case .in:
            return true
        case .out:
            return false
        }
    }
}
