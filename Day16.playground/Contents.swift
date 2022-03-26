//
//  ContentView.swift
//  WeSplit
//
//  Created by 진승연 on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    // @State private var tapCount = 0
    // @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        /*
        Form {
            TextField("Enter your name", text: $name) // $ = for 2-way binding
            Text("Your name is \(name)")
        }
         */
        /*
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
         */
        /*
        NavigationView {
            Form {
                // to work around the '10' limitation of Swift
                /*
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                 */
                Section {
                    Text("Hello, world!")
                }
            }.navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

