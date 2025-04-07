//
//  MissionView.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 16.03.2025.
//

import SwiftUI
import Translation

struct MissionView: View {
    
    @State var showTranslation = false
    
    let mission: Mission
    let crew: [CrewMember]
    
    // CrewMember type definition
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    init(mission: Mission, astronaut: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ crewRole in
            if let astronaut = astronaut[crewRole.name] {
                return CrewMember(role: crewRole.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(crewRole.name)")
            }
        })
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                Text(mission.formattedDate)
                    .font(.title.bold())
                
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .myDevider()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                        .onTapGesture {
                            showTranslation = true
                        }
                    
                    Rectangle()
                        .myDevider()
                    Text("Crew")
                        .font(.title.bold())
                        //.padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                TestView(image: crewMember.astronaut.id, titleText: crewMember.astronaut.name, subtitleText: crewMember.role)
                                
                                
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .translationPresentation(isPresented: $showTranslation, text: mission.description)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronaut: astronauts)
        .preferredColorScheme(.dark)
}
