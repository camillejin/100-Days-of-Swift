import UIKit


// Handling Missing Data
var age: Int? = nil // holds nothing
age = 38


// Unwrapping Optionals
var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


// Unwrapping with Guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)")
}


// Force Unwrapping
let str = "5"
let num = Int(str) // optional Int
// Int(str)! -> Int, but you need to be sure that it won't cause error


// Implicitly Unwrapped Optionals
// you can use them as if they weren't optional at all
let age: Int! = nil
// sometimes a var will start life as nil, but will always have a value before you need to use it


// Nil Coalescing
// Unwraps an optional and returns the value inside if there is one
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"
// if username returns nil, it will turn into "Anonymous"


// Optional Chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
// a.b?.c
// Swift will check whether b has a value, and if it's nil, the rest of the line will be ignored


// Optional Try
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws ->
    Bool {
    if password == "password" {
        throw Password.Error.obvious
    }
    return true
}
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
// alternative using if let
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
// second alternative using try!
// when you know for sure the function will not fail
try! checkPassword("sekrit")
print("OK!")


// Failable Initializers
struct Person {
    var id: String
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}


// Typecasting
class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()] // type Animal?
for pet in pets {
    // check whether each pet is a Dog object, and if it is, call makeNoise()
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}


// Optionals Summary
/*
 1. Optionals let us represent the absence of a value in a clear and unambiguous way
 2. Swift won't let us use optionals w/o unwrapping them, either using if let or using guard let
 3. You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash
 4. Implicitly unwrapped optionals don't have the safety checks of regular optionals
 5. You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside
 6. Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 7. You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 8. If you need your initializer to fail when it's given bad input, use init?() to make a failable initializer
 9. You can use typecasting to convert one type of object to another
 */
