//
//  ContentView.swift
//  War Card Game
//
//  Created by Kamil Samaj on 21.01.2024.
//

import SwiftUI

struct ContentView: View {
    // cards
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    // scores
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Button(
                    action: {
                        resetScores()
                    },
                    label: {
                        Image("logo")
                    })
                
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()

//                Button("Deal") {
//                    deal()
//                }
//                .foregroundColor(.white)

                Button(
                    action: {
                        deal()
                }, label: {
                    Image("button")
                })
                .foregroundColor(.white)
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize the cards
        let playerCardValue = Int.random(in: 2...14)
        let cpuCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        cpuCard = "card" + String(cpuCardValue)
        
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            cpuScore += 1
        }
    }
    
    func resetScores() {
        playerScore = 0
        cpuScore = 0
    }
}

#Preview {
    ContentView()
}
