//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Nuno Mendonça on 02/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    @State var sortAlphabetic = false
    @State var currentFilter: TypeFilters = .all
    @State var currentMovieFilter: String = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)
        apController.filterByMovie(movie: currentMovieFilter)
        
        
        if sortAlphabetic {
            
            apController.sortByAlphabetical()
        } else {
            
            apController.sortByMovieAppearance()
        }
        
        return NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
                    
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            sortAlphabetic.toggle()
                        }
                    } label: {
                        if sortAlphabetic {
                            
                            Image(systemName: "film")
                        } else {
                            
                            Image(systemName: "textformat")
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(TypeFilters.allCases, id: \.self) { type in
                                HStack {
                                    Text(type.rawValue.capitalized)
                                    Spacer()
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter By Movie", selection: $currentMovieFilter.animation()) {
                            
                            ForEach(apController.allMovies, id: \.self) { movie in
                                Text(movie)
                            }
                            
                        }
                    } label: {
                        Image(systemName: "popcorn.circle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
