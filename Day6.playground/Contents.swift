import UIKit

// Creating Basic Closures
let driving = {
    print("I'm driving in my car")
}
driving()


// Accepting Parameteres in a closure
let driving2 = { (place: String) in // closures cannot use external parameters
    print("I'm going to \(place) in my car")
}
driving2("London") // don't use parameter labels when running closures


// Returning Values from a Closure
let drivingWithReturn = { (place: String) -> String
    in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)


// Closures as Parameters
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)


// Trailing Closure Syntax
travel { // we can eliminate ()
    print("I'm driving in my car")
}
// because its last parameter is a closure, we can call travel using closure syntax

