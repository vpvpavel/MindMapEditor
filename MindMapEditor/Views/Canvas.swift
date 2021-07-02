//
//  Canvas.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 7/1/21.
//

import SwiftUI

struct Canvas: View {
    @EnvironmentObject var viewModel: MMEViewModel
    
    var body: some View {
        ZStack {
            if #available(macCatalyst 14.0, *) {
                Color.gray
                    .ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
            Mesh()
            CanvasRepresentable()
        }
    }
}

//struct Canvas_Previews: PreviewProvider {
//    static var previews: some View {
//        Canvas()
//    }
//}
