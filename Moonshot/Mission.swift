//
//  Mission.swift
//  Moonshot
//
//  Created by Vitaliy Novichenko on 15.03.2025.
//

import Foundation

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    var formattedDate: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
    
}

