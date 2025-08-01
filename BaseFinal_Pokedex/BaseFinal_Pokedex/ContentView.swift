//
//  ContentView.swift
//  BaseFinal_Pokedex
//
//  Created by Artur Ferreira on 31/07/25.
//

import SwiftUI
import Charts

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
]

struct ContentView: View {
    
    
    var data: [ToyShape] = [
        .init(type: "Zaroark", count: 5),
        .init(type: "Spinda", count: 7),
        .init(type: "Aromatisse", count: 8),
        .init(type: "Zorua", count: 3),
        .init(type: "Basculegion", count: 3),
    ]
    var data2: [ToyShape] = [
        .init(type: "Grass", count: 5),
        .init(type: "Eletric", count: 7),
        .init(type: "Fire", count: 8),
        .init(type: "Flying", count: 3),
        .init(type: "Dragon", count: 3),
        .init(type: "Water", count: 3),
    ]
    
    
    
    @State var isOn: Bool = false
    var cornerRadius: CGFloat = 30
    var body: some View {
        TabView {
            
            VStack {
                VStack(spacing: 0) {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(pokemons, id: \.id) { pokemon in
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .frame(width: 150, height: 150)
                                        .foregroundStyle(.white)
                                    VStack {
                                        Text("\(pokemon.name)").fontWeight(.heavy)
                                        AsyncImage(url: URL(string:
                                                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png"
                                                           )) {
                                            image in
                                            image.image
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red.ignoresSafeArea())
            }
            .tabItem {
                Label("Pokedex", systemImage: "character.book.closed.fill.ar")
            }
            // Your first view
            
            
            // Your second view
                ZStack {
                    Color.red
                    VStack(spacing: 20) {
                        GroupBox("Pokemons Lendários coletados") {
                            Chart {
                                BarMark(
                                    x: .value("Shape Type", data[0].type),
                                    y: .value("Total Count", data[0].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data[1].type),
                                    y: .value("Total Count", data[1].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data[2].type),
                                    y: .value("Total Count", data[2].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data[3].type),
                                    y: .value("Total Count", data[3].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data[4].type),
                                    y: .value("Total Count", data[4].count)
                                )
                                
                            }
                            .frame(height: 200)
                            .bold()
                        }
                        GroupBox("Tipos de Pokemons coletados") {
                            Chart {
                                BarMark(
                                    x: .value("Shape Type", data2[0].type),
                                    y: .value("Total Count", data2[0].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data2[1].type),
                                    y: .value("Total Count", data2[1].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data2[2].type),
                                    y: .value("Total Count", data2[2].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data2[3].type),
                                    y: .value("Total Count", data2[3].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data2[4].type),
                                    y: .value("Total Count", data2[4].count)
                                )
                                BarMark(
                                    x: .value("Shape Type", data2[5].type),
                                    y: .value("Total Count", data2[5].count)
                                )
                                
                            }
                            .frame(height: 200)
                        }
                        }
                        
                    }
                .tabItem {
                    Label("Estatistica", systemImage: "chart.bar.horizontal.page.fill")
                }
                }

        }
    }

#Preview {
    ContentView()
}


struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}
