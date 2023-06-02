//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Nuno Mendonça on 02/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(apController.apexPredators) { apexPredator in
                    
                    NavigationLink(destination: Text("Dino Details go Here")) {
                        Text(apexPredator.name)
                    }
                }
            }
            .navigationTitle("Apex Predators")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
