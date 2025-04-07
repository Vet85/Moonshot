//
//  ContentView.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 13.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var capsuleImage = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowingGrid = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    if isShowingGrid {
                        GridLayout()
                    } else {
                        ListLayout()
                    }
                }
            }
            //.navigationTitle("My")
           // .padding(.vertical)
            .navigationTitle("Moonshot")
            
            .background(.darkBackground)
            
        .toolbar {
                Button {
                    withAnimation(.easeInOut) {
                        isShowingGrid.toggle()
                    }
                } label: {
                    !isShowingGrid ? Image(systemName:  "square.grid.3x3.topleft.filled") : Image(systemName: "text.justify")
                }
                       // .foregroundStyle(.white)
                        .font(.title2.bold())
                        .padding(.horizontal)
                        .accentColor(.white)
                
                
            }
        .preferredColorScheme(.dark)
       // .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
