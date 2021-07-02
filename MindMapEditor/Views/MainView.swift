//
//  MainView.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 6/30/21.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MMEViewModel()
    
    var body: some View {
        HStack(spacing: 0) {
            Canvas().environmentObject(viewModel)
            ToolsPanel().environmentObject(viewModel)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
