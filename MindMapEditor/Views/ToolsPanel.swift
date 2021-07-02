//
//  ToolsPanel.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/10/20.
//

import SwiftUI

struct ToolsPanel: View {
    @State private var showDetails = false
    @EnvironmentObject var viewModel: MMEViewModel
    
    
    var body: some View {
        
        HStack {
            VStack {
//                Text(viewModel.selectedNode?.title ?? "")
//                    .foregroundColor(.white)
//                    .padding()
//                    .font(.title)
                Spacer()
                Button(action: {
                    viewModel.createNode()
                    showDetails.toggle()
                }) {
                    Image(systemName: "plus.circle")
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                
                if showDetails {
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

//struct ToolsPanel_Previews: PreviewProvider {
//    static var previews: some View {
//        ToolsPanel()
//    }
//}
