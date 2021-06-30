//
//  ToolsPanel.swift
//  MindMapEditor
//
//  Created by Pavlo Vorobiov on 12/10/20.
//

import SwiftUI

struct ToolsPanel: View {
    @State private var showDetails = false
    
    var body: some View {
        //        List(0..<5) {_ in
        //            Text("Hello world")
        //        }
        
        HStack {
            VStack {
                Text("Settings")
                    .foregroundColor(.black)
                    .padding(.all, 20)
                    .font(.title)
                Button(action: {
                    self.showDetails.toggle()
                }) {
                    Text("New node")
                }
                
                if showDetails {
                    Text("")
                        .font(.largeTitle)
                }
            }
//            .background(Color.white)
        }
        
        Spacer()
    }
}

struct ToolsPanel_Previews: PreviewProvider {
    static var previews: some View {
        ToolsPanel()
    }
}


//
//import SwiftUI
//
//struct ButtonY: View {
//
//    @State private var buttonSize: CGFloat = 0
//    @State private var buttonOffset: CGFloat = 0
//    @State private var buttonColor: Color = .gray
//    @State private var toggled: Bool = false
//
//
//    var body: some View {
//        ZStack {
//
//            offWhite.edgesIgnoringSafeArea(.all)
//
//            Capsule()
//                .frame(width: capsuleSize, height: capsuleSize / 2)
//                .foregroundColor(buttonColor)
//                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
//            ZStack{
//                Capsule()
//                .frame(width: buttonSize, height: (capsuleSize / 2) * 0.85)
//                .foregroundColor(offWhite)
//                .offset(x: buttonOffset)
//                Capsule()
//                    .stroke(offWhite, lineWidth: 3)
//                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 4, y: 4)
//                    .clipShape(
//                        Capsule()
//                    )
//                    .shadow(color: Color.white.opacity(0.8), radius: 4, x: -5, y: -5)
//                    .clipShape(
//                        Capsule()
//                    )
//                    .frame(width: buttonSize, height: (capsuleSize / 2) * 0.85)
//                    .foregroundColor(offWhite)
//                    .offset(x: buttonOffset)
//            }
//                .onTapGesture {
//                    toggleButton()
//                }
//
//        }
//        .onAppear {
//            buttonSize = (capsuleSize / 2) * 0.85
//            buttonOffset = -capsuleSize / 4
//        }
//    }
//
//    //MARK: - Drawing constants
//    let capsuleSize: CGFloat = 250
//    let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
//
//    //MARK: - Functions
//    func toggleButton() {
//        if toggled {
//            withAnimation(Animation.easeInOut(duration: 0.5)) {
//                buttonSize = capsuleSize * 0.925
//                buttonOffset = 0
//                buttonColor = .gray
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                withAnimation(Animation.easeInOut(duration: 0.5)) {
//                    buttonSize = (capsuleSize / 2) * 0.85
//                    buttonOffset = -capsuleSize / 4
//                }
//            }
//            toggled.toggle()
//        } else {
//            withAnimation(Animation.easeInOut(duration: 0.5)) {
//                buttonSize = capsuleSize * 0.925
//                buttonOffset = 0
//                buttonColor = .green
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                withAnimation(Animation.easeInOut(duration: 0.5)) {
//                    buttonSize = (capsuleSize / 2) * 0.85
//                    buttonOffset = capsuleSize / 4
//                }
//            }
//            toggled.toggle()
//        }
//    }
//}
