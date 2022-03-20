import UIKit


// Protocols
// way of describing what properties and methods something must have
protocol Identifiable {
    var id: String { get set }
}
struct User: Identifiable {
    var id: String
}
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


// Protocol Inheritance
protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation {
}


// Extensions
// allow you to add methods to existing types, to make them do things they weren't originally designed to do
extension Int {
    func squared() -> Int {
        return self*self
    }
}
let number = 8
number.squared()
extension Int {
    var isEven: Bool {
        return self % 2 = 0
    }
}


// Protocol Extensions
// rather than extending a specific type like Int, you extend a whole protocol so that all conforming types get your changes
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()


// Protocol-Oriented Programming
protocol Identifiable {
    var id: String { get set }
    func identify()
}
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}
struct User: Identifiable {
    var id: String
}
let twostraws = User(id: "twostraws")
twostraws.identify()


// Protocols and Extensions Summary
/*
 1. Protocols describe what methods and properties a conforming type must have, but don't provide the implementation of those methods
 2. You can build protocols on top of other protocols, similar to classes
 3. Extensions let you add methods and computed properties to specific types such as Int
 4. Protocol extensions let you add methods and computed properties to protocols
 5. Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations
 */
