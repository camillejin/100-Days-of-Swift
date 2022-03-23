import UIKit




// Functions
func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}
favoriteAlbum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}
printAlbumRelease(name: "Fearless", year: 2008)

func countLetters(in str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLetters(in: "Hello")

func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true}
    return false
}
if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("who made that?")
}
if albumIsTaylors(name: "The White Album") {
    print("That's one of hers")
} else {
    print("Who made that?")
}





// Optionals
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status = getHaterStatus(weather: "rainy")
// type is String?

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let unwrappedStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: unwrappedStatus)
}

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int? {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    return nil
}
let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

var year = yearAlbumReleased(name: "Taylor Swift")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

var name: String = "Paul"
var name2: String? = "Bob"
// must be unwrapped before it is used
var name3: String! = "Sophie"
// Swift lets you access the value directly without unwrapping safety





// Optional Chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}
let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")





// Enumerations
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}
func getMyStatus(weather: WeatherType) -> String? {
    switch(weather) { // switch evaluates from top to bottom
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    default:
        return "love"
    }
}
getMyStatus(weather: .cloud)






// Structs
struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy) // taylor and taylorCopy are different






// Classes
class PersonClass {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    @objc func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrr rargh rargh rarrrgh!")
    }
}

var taylorswift = CountrySinger(name: "Taylor", age: 25)
taylorswift.name
taylorswift.age
taylorswift.sing()
