//
//  ContentView.swift
//  Moonshot
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    if (showingGrid) {
                        GridLayout(astronauts: astronauts, missions: missions)
                    } else {
                        ListLayout(astronauts: astronauts, missions: missions)
                    }
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
            .toolbar{
                ToolbarItem() {
                    Button("Change View") {
                        showingGrid.toggle()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
