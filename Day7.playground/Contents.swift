import UIKit


// Using Closures as Parameters When They Accept Parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel { (place: String) in
    print("I'm going to \(place) in my car")
}


// Using Closures as Parameters When They Return Values
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}


// Shorthand Parameter Names
travel2 { place in // no need to explicitly write out input and output types
    "I'm going to \(place) in my car" // can remove the return keyword(because it's obvious)
}


// Closures with Multiple Parameters
func travel3(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel3 {
    "I'm going to \($0) at \($1) miles per hour."
}


// Returning Closures from Functions
func travel4() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result = travel4()
result("London")
let result2 = travel4()("London")


// Capturing Values
let result3 = travel4()
result("London")
result("London")
result("London") // the counter var will go up and up


// Closures Summary
/*
 1. You can assign closures to variables, then call them later on.
 2. Closures can accept parameters and return vales, like regular functions
 3. You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value
 4. If the last parameter to your function is a closure, you can use trailing closure syntax
 5. Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them
 6. If you use external values inside your closures, they will be captured so the closure can refer to them later. 
 */
