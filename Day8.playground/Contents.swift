import UIKit


// Creating Your Own Structs
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"


// Computed Properties
struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        }
        else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// Property Observers
// let you run code before or after any property changes
struct Progress {
    var task: String
    var amount: Int {
        didSet { // this will run every time amount changes
            print("\(task) is now \(amount)% complete")
        }
        willSet { // this will run before amount changes
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Methods
// functions inside structs are called methods
// they still use the same func keyword
struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population*1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()


// Mutating Methods
// when you want to change a property inside a method, mark it using the 'mutating' keyword
struct Person {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()


// Properties and Methods of Strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted()) // sort the letters of the string into an array


// Properties and Methods of Arrays
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
