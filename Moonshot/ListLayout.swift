//
//  ListLayout.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 27.03.2025.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ZStack {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronaut: astronauts)
                    
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55)
                            .padding(.horizontal)
                            .padding(.horizontal, 35)
                        VStack(alignment: .listRowSeparatorLeading) {
                            Text(mission.displayName)
                                .foregroundStyle(.white)
                                .font(.title2.bold())
                                .padding(.horizontal)
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
//                    Divider()
//                        .foregroundStyle(.white)
                    
                    
                    
                    
                }
                    
                        .listRowBackground(Color.darkBackground)
                    
                    
                
            }
        }
      //  .ignoresSafeArea()
        
        
        .listStyle(.plain)
        .background(.darkBackground)
    }
}


#Preview {
    ListLayout()
}
