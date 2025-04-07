//
//  AstronautView.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 19.03.2025.
//

import SwiftUI
import Translation

struct AstronautView: View {
    
    
    @State var showTranslation = false
    
    let astronaut: Astronaut
    var missionFlown = [Mission]()
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        
        
        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                missionFlown.append(mission)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axes in width * 0.94}
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    Rectangle()
                        .myDevider()
                    Text(astronaut.description)
                        //.padding()
                        .onTapGesture {
                            showTranslation = true
                        }
                    Rectangle()
                        .myDevider()
                    Text("List of Missions")
                        .font(.title.bold())
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(missionFlown, id: \.id) { mission in
                            NavigationLink {
                                Text("Mission description")
                            } label: {
                                TestView(image: mission.image, titleText: mission.displayName, subtitleText: mission.formattedDate)
                                    
                            }
                        }
                    }
                }
                
            }
            
            
        }
        
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .translationPresentation(isPresented: $showTranslation, text: astronaut.description)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
        
}
