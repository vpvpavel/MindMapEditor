//
//  Canvas.swift
//  MindMapEditor
//
//  Created by Pavlo on 25.01.2021.
//

import UIKit
import SwiftUI

struct Canvas: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let canvasViewController = CanvasViewController()
        return canvasViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
