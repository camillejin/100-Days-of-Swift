//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 진승연 on 2022/03/29.
//

import SwiftUI

struct FlagImage: View {
    var number: Int
    var countries: [String]
    
    var body: some View {
        Image(countries[number])
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 0)
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var mistake = ""
    @State private var gameCount = 0
    @State private var gameOver = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var tapped = [false, false, false]
    @State private var animationAmount = 0.0
    @State private var opacityAmount = 1.0
    @State private var notChosenSize = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation { flagTapped(number) }
                        } label: {
                            FlagImage(number: number, countries: countries)
                        }
                        .scaleEffect(tapped[number] ? 1 : notChosenSize)
                        .rotation3DEffect(.degrees(tapped[number] ? animationAmount : 0), axis: (0.0, 1.0, 0.0))
                        .opacity(tapped[number] ? 1 : opacityAmount)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(mistake + "Your score is \(userScore)")
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(userScore)")
        }
    }

    func flagTapped(_ number: Int) {
        tapped[number] = true
        animationAmount += 360
        opacityAmount = 0.25
        notChosenSize = 0.0
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 10
            mistake = ""
        } else {
            scoreTitle = "Wrong"
            if userScore > 0 {
                userScore -= 10
            }
            mistake = "That's the flag of \(countries[number])!\n"
        }
        gameCount += 1
        if gameCount == 8 {
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animationAmount = 0.0
        opacityAmount = 1.0
        notChosenSize = 1.0
        tapped = [false, false, false]
    }
    
    func restartGame() {
        userScore = 0
        gameCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
