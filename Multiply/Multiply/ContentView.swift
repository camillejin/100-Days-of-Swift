//
//  ContentView.swift
//  Multiply
//

import SwiftUI


struct Question {
    var questionText: String
    var answer: Int
}

struct ContentView: View {
    
    @State private var score = 0
    @State private var upto = 2
    @State private var nQuestions = 5
    @State private var nqoptions = [5, 10, 20]
    @State private var questions = [Question]()
    @State private var diffoptions = ["easy", "difficult"]
    @State private var difficulty = "easy"
    @State private var start = false
    @FocusState private var numberIsFocused: Bool
    
    @State private var answer = 0
    @State private var typedAnswer: Int = 0
    @State private var questionNumber = 0
    
    @State private var gameOver = false
    
    
    var body: some View {
        if start == false {
            NavigationView {
                VStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        Text("Select Multiplication Table")
                            .foregroundColor(Color.blue)
                        Stepper("Up to... :   \(upto)", value : $upto, in: 2...12)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.cyan, lineWidth: 5)
                            )
                    }
                    .frame(width: 300, height: 100)
                    
                    VStack(alignment: .leading) {
                        Text("Number of Questions")
                            .foregroundColor(Color.blue)
                        Picker("", selection: $nQuestions) {
                            ForEach(nqoptions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.cyan, lineWidth: 5)
                        )
                    }
                    .frame(width: 300, height: 100)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Difficulty")
                            .foregroundColor(Color.blue)
                        Picker("", selection: $difficulty) {
                            ForEach(diffoptions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.cyan, lineWidth: 5)
                        )
                    }
                    .frame(width: 300, height: 100)
                    
                    Circle()
                        .fill(.cyan)
                        .onTapGesture {
                            generateQuestions()
                            start = true
                        }
                        .overlay(Text("START"))
                        .frame(width: 150, height: 150)
                }
                .navigationTitle("Settings")
            }
        }
        else {
            
            NavigationView {
                if gameOver {
                
                }
                else if difficulty == "easy" {
                    VStack(spacing: 30) {
                        Text(questions[questionNumber].questionText)
                            .foregroundColor(Color.cyan)
                            .font(.largeTitle.bold())
                            .padding()
                        HStack(spacing: 20) {
                            ForEach(0..<3) { number in
                                Button {
                                    nextQuestion(number)
                                } label: {
                                    if number == answer {
                                        Text("\(questions[questionNumber].answer)")
                                    } else {
                                        var randInt = Int.random(in: 0..<145)
                                        Text(questions[questionNumber].answer == randInt ? "\(randInt+1)" : "\(randInt)")
                                    }
                                }
                                .frame(width: 50, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color.cyan, lineWidth: 5)
                                )
                            }
                        }
                    }
                    Spacer()
                }
                else {
                    VStack {
                        Text(questions[questionNumber].questionText)
                            .foregroundColor(Color.cyan)
                            .font(.largeTitle.bold())
                            .padding()
                        NavigationView {
                            TextField("Your Answer: ", value: $typedAnswer, format: .number)
                                .padding()
                                .frame(width: 300, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .stroke(Color.cyan, lineWidth: 5)
                                )
                                .keyboardType(.decimalPad)
                                .focused($numberIsFocused)
                                
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    numberIsFocused = false
                                    nextQuestion(typedAnswer)
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
            .alert("Game Over", isPresented: $gameOver) {
                Button("Restart", action: restart)
            } message: {
                Text("You got \(score) out of \(nQuestions)")
            }
        }
    }
    
    func generateQuestions() {
        var firstnumber: Int
        var secondnumber: Int
        for _ in 0..<nQuestions {
            firstnumber = Int.random(in: 2..<upto+1)
            secondnumber = Int.random(in: 1..<10)
            questions.append(Question(questionText: "What is \(firstnumber) x \(secondnumber) ?", answer: firstnumber*secondnumber))
        }
        answer = Int.random(in: 0..<3)
    }
    
    func nextQuestion(_ number: Int) {
        if number == questions[questionNumber].answer {
            score += 1
        }
        typedAnswer = 0
        questionNumber += 1
        if questionNumber == nQuestions {
            gameOver = true
        }
        
    }
    
    func restart() {
        start = false
        score = 0
        upto = 2
        nQuestions = 5
        questionNumber = 0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
