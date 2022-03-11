import UIKit

// Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]


// Sets
// 1. Random order
// 2. All items must be unique
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])
// both sets only include red, green and blue once.


// Tuples
// 1. fixed in size
// 2. Cannot change the type of items
// 3. Accessible through number and names
var name = (first: "Taylor", last: "Swift")
name.0 //"Taylor"
name.first //"Taylor"


// Arrays, Sets, Tuples
// Tuples - for specific, fixed collection of related values
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
// Set - for collection of unique values or for checking whether the item exists quickly
let set = Set(["aardvark", "astronaut", "azalea"])
// Arrays - if containing duplicates or order matters (Most common)
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]


// Dictionaries
// identifiers(keys) are used to read data out of the dictionary
// type annotations example: [String: Double]
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"] // 1.78


// Dictionary Default Values
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"] // "Chocolate"
favoriteIceCream["Charlotte"] // nil
favoriteIceCream["Charlotte", default: "Unknown"] // "Unknown"


// Creating Empty Collections
// Swift has special syntax only for dictionaries and arrays
var teams = [String: String]() // creates empty dictionary
// equal to var teams = Dictionary<Sring, String>()
teams["Paul"] = "Red"
var results = [Int]() // creates empty array
// equal to var results = Array<Int>()

var words = Set<String>() // creates empty set
var numbers = Set<Int>()


// Enumerations
// way of defining groups of related values in a way that makes them easier to use
enum Result {
    case success
    case failure
}

let result4 = Result.failure


// Enum Associated Values
// lets us add additional details to enum cases
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")


// Enum Raw Values
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2) // earth
// if case mercury = 1, the cases are counted starting from 1. So earth becomes the third planet. the constant earth will now contain venus


// Summary
/*
 1. Arrays, sets, tuples and dictionaries let you store a group of items under a single value. They each do this in different ways. So which you use depends on the behavior you want.
 2. Arrays store items in the order you add them, and you access them using numerical positions
 3. Sets store items without any order, so you can't access them using numbers
 4. Tuples are fixed in size. You can attach names to each items
 5. Dictionaries store items according to a key, and you can read items using those keys
 6. Enums are a way of grouping related values.
 7. You can attach raw values to enums so that they can be created from integers or strings. You can also attach associated values to enums to store additional information
 */
