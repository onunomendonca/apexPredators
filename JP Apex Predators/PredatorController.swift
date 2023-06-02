//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Nuno Mendonça on 02/06/2023.
//

import Foundation

enum TypeFilters: String, CaseIterable {
    
    case all
    case land
    case air
    case sea
}

class PredatorController {
    
    var apexPredators: [ApexPredator] = []
    private var allApexPredators: [ApexPredator] = []
    
    init() {
        
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {

        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators

            } catch {
                print("Error decoding JSON data \(error)")
            }
        }
    }
    
    func typeIcon(for type: TypeFilters) -> String {
        
        switch type {
            
        case .all:
            return "square.stack.3d.up.fill"
        case .land:
            return "leaf.fill"
        case .air:
            return "wind"
        case .sea:
            return "drop.fill"
        }
    }
    
    func filterBy (type: TypeFilters) {
        
        switch type {

        case .all:
            apexPredators = allApexPredators
        case .land:
            apexPredators = allApexPredators.filter({ $0.type == TypeFilters.land.rawValue})
        case .air:
            apexPredators = allApexPredators.filter({ $0.type == TypeFilters.air.rawValue})
        case .sea:
            apexPredators = allApexPredators.filter({ $0.type == TypeFilters.sea.rawValue})
        }
    }
    
    func sortByAlphabetical() {
        
        apexPredators.sort(by: {$0.name < $1.name})
    }
    
    func sortByMovieAppearance() {
        
        apexPredators.sort(by: {$0.id < $1.id})
    }
}
