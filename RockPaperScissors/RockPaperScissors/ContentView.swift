//
//  ContentView.swift
//  RockPaperScissors
//

import SwiftUI

struct ContentView: View {
    let moves = ["rock", "paper", "scissors"]
    let movesEmoji = ["✊", "✋", "✌️"]
    let win = ["paper", "scissors", "rock"]
    let lose = ["scissors", "rock", "paper"]
    
    @State var appsChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var score: Int = 0
    @State var stage = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    func moveTapped(_ number: Int) {
        
        if (shouldWin) && (moves[number] == win[appsChoice]) {
            score += 10
        }
        else if (!shouldWin) && (moves[number] == lose[appsChoice]) {
            score += 10
        }
        
        stage += 1
        if stage == 10 {
            showingScore = true
            stage = 0
        }
        shouldWin.toggle()
        appsChoice = Int.random(in: 0...2)
    }
    
    func restart() {
        score = 0
    }
    
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                Text("Score: \(score)")
                    .font(.system(size: 20))
                VStack {
                    Text(moves[appsChoice])
                        .font(.system(size: 40))
                    Text(movesEmoji[appsChoice])
                        .font(.system(size: 50))
                }
                Text(shouldWin ? "You should WIN" : "You should LOSE")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
                    
            }
            
            HStack {
                ForEach(0..<3){ number in
                    Button {
                        moveTapped(number)
                    } label : {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(lineWidth: 2)
                            Text(movesEmoji[number])
                                .font(.largeTitle.bold())
                        }
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: 200)
        }
        .alert("Game Over", isPresented: $showingScore) {
            Button("Restart", action: restart)
        } message: {
            Text("Your score is \(score)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
