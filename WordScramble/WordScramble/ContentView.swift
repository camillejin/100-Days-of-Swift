//
//  ContentView.swift
//  WordScramble
//
//  Created by 진승연 on 2022/04/15.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .autocapitalization(.none)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(rootWord)
                .toolbar {
                        Button("Restart") {
                            startGame()
                    }
                }
                
            }
            Text("Score: \(score)")
        }
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
    }
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        // Extra validation to come
        guard isOriginal(word: answer) else {
            wordError(title: "word used already",
                      message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "word not possible",
                      message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isTooShort(word: answer) else {
            wordError(title: "word is too short",
                      message: "The word needs to be longer than three letters!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized",
                      message: "You can't just make them up, you know!")
            return
        }
        
        guard isStartWord(word: answer) else {
            wordError(title: "Word is a start word",
                      message: "You need to be original")
            return
        }
        
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += 10 * answer.count
        
        newWord = ""
    }
    
    func startGame() {
        
        usedWords = [String]()
        newWord = ""
        score = 0
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("Could not load start.txt from Bundle.")
    }
    
    
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
    
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isTooShort(word: String) -> Bool {
        // disallow answers that are shorter than three letters
        if (word.count <= 3) {
            return false
        }
        else { return true }
    }
     
    func isStartWord(word: String) -> Bool {
        if (word == rootWord) {
            return false
        } else { return true }
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
