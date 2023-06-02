//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by Nuno Mendonça on 02/06/2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        
        switch type {
            
        case "land": return .brown
        case "sea": return .blue
        case "air": return .teal
        default: return .brown
        }
    }
}

struct MovieScene: Codable, Identifiable {
    
    let id: Int
    let movie: String
    let sceneDescription: String
}
