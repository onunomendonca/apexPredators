//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Nuno Mendonça on 02/06/2023.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                
                Image(predator.type.lowercased())
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter{ $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 6)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            VStack(alignment: .leading) {
                
                Text(predator.name)
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                
                Text("Appears in:")
                    .font(.title3)
                
                // Como String nao é Identifiable, colocamos a propria string como ID.
                ForEach(predator.movies, id: \.self) { movie in
                    Text("•" + movie)
                        .font(.subheadline)
                }
                
                Text("Movie Moments")
                    .font(.title)
                    .padding(.top, 15)
                
                ForEach(predator.movieScenes) { scene in
                    Text(scene.movie)
                        .font(.title2)
                        .padding([.top, .bottom], 1)
                    
                    Text(scene.sceneDescription)
                        .padding(.bottom, 15)
                }
                
                Text("Read More:")
                    .font(.caption)
                Link(predator.link, destination: URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let movieScene1 = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
        let movieScene2 = MovieScene(id: 4, movie: "Jurassic World", sceneDescription: "In Jurassic World, a pack of Velociraptors each with their own names, Blue, Charlie, Delta, and Echo, are trained by Owen Grady. These raptors each have their unique personalities and skin colors and even head anatomy. InGen, the company that cloned the dinosaurs, wants to use the raptors for military applications. This is also the first time raptors developed a personal bond with humans.\n\nVic Hoskins convinced the IBRIS Project trainers to utilize the raptors in the pursuit of an escaped Indominus rex. But the raptors began to attack humans as the Indominus rex had raptor DNA and became their alpha. In the chaos, Charlie was blown to bits by a rocket launcher. Delta and Echo then tried to eat Claire Dearing, Gray, and Zach Mitchell in their van. Sometime later, Delta suddenly appeared in the Hammond Creation Lab unexpectedly before Owen, Claire, Hoskins, and the boys. They are forced to flee after the raptor killed Hoskins, who failed at trying to calm her down by copying Owen's hand gesture. After killing Hoskins, Delta continued her pursuit of Owen, Claire and the boys before being distracted by a hologram of a Dilophosaurus activated by Gray, but continued her pursuit after realizing it wasn't real.\n\nSoon it turned out Blue herded the humans into a trap. Just as they trapped the humans, the Indominus walked into view. The raptors, however, turned on the Indominus as Owen takes off the video camera from Blue's head, realizing that the hybrid was merely using them. As they refought the Indominus with Owen's help, Blue was knocked unconscious while the other raptors were overpowered. Later, Blue regained consciousness and rejoined the fight, lunging at the hybrid and allowing Jurassic World's T. rex that was from the original Jurassic Park park who had joined the battle in her absence, to get back on her feet after she was pushed to the ground by the Indominus rex. Blue helped the T. rex attack the I. rex. Suddenly, the Mosasaurus dragged the I. rex into the bottom of the lagoon. After the fight, the T. rex decides to spare Blue, most likely due to the already extensive injuries caused by Indominus. Blue then turned towards Owen, chirping at him momentarily before disappearing into the night.")
        let predator = ApexPredator(id: 3, name: "Tyrannosaurus Rex", type: "Land", movies: ["Jurassic Park","The Lost World: Jurassic Park","Jurassic Park III","Jurassic World","Jurassic World: Fallen Kingdom"], movieScenes: [movieScene1, movieScene2], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
        
        PredatorDetail(predator: predator)
            .preferredColorScheme(.dark)
    }
}
