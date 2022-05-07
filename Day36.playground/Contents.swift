import SwiftUI
import Foundation


// @State only works with structs


/*
struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

*/






// Sharing SwiftUI state with @StateObject


/*
class User: ObservableObject {
    // we want other things to be able to monitor the change in the User class
    
    // when either of these change, please reload
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    // @State does not watch the value inside a class
    @StateObject var user = User()
    /*
    when you want to use a class instance elsewhere,
     (when you've created it in view A using @StateObject and
     want to use that same object in view B)
     you use a slightly different property wrapper called @ObservedObject
     */
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
*/




//  Sharing SwiftUI state with @StateObject
/*
 struct SecondView: View {
     @Environment(\.dismiss) var dismiss
     
     let name: String
     
     var body: some View {
         Button("Dismiss") {
             dismiss()
         }
     }
 }

 struct ContentView: View {
     @State private var showingSheet = false
     
     var body: some View {
         Button("Show Sheet") {
             showingSheet.toggle()
         }
         .sheet(isPresented: $showingSheet) {
             SecondView(name: "@TwoStraws")
         }
     }
 }
 */





// Deleting items using onDelete()
/*
struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("And Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}
 */



// Storing user settings with UserDefaults
/*
struct ContentView: View {
 // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
     
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}
 */






// Archiving Swift Objects with Codable

/*
 struct User: Codable {
     // Codable protocol - for archiving and unarchiving
     
     let firstName: String
     let lastName: String
 }

 struct ContentView: View {
     @State private var user = User(firstName: "Taylor", lastName: "Swift")
     
     var body: some View {
         Button("Save User") {
             // when to archive and what to do with the data
             let encoder = JSONEncoder()
             
             if let data = try? encoder.encode(user) {
                 UserDefaults.standard.set(data, forKey: "UserData")
             }
         }
     }
 }
 */
