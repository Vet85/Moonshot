//
//  TestView.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 26.03.2025.
//

import SwiftUI

struct TestView: View {
    
    let image: String
    let titleText: String
    let subtitleText: String
    
    var body: some View {
        HStack {
            //Image(crew.astronaut.id)
            Image(image)
                                .resizable()
                                .frame(width: 104, height: 72)
                               // .containerRelativeFrame(.horizontal) {width, axes in width * 0.2}
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            VStack(alignment:.leading) {
//                                Text(crew.astronaut.name)
                                Text(titleText)
                                    .foregroundStyle(.white)
                                
                                    .font(.headline)
//                                Text(crew.role)
                                Text(subtitleText)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                }
            

//#Preview {
//    TestView()
//}
