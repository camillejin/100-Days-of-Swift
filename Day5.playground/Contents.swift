import UIKit

// Writing Functions
func printHelp() {
    let message = """
Welcome to MyApp!
Run this app inside a directory of images and MyApp will resize them all into thumbnails
"""
    print(message)
}
printHelp()


// Accepting Parameters
print("Hello, world!")
func square(number: Int) {
    print(number * number)
}
square(number: 8)


// Returning Values
func square2(number: Int) -> Int {
    return number * number
}
let result2 = square2(number: 8)
print(result2)


// Parameter Labels
func square3(number: Int) -> Int {
    return number * number
}
let result3 = square3(number: 8)

// two names
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "Taylor")


// Omitting Parameter Labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Taylor")


// Default Parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true { print("Hello, \(person)!") }
    else { print("Oh no, it's \(person) again...") }
}
greet("Taylor")
greet("Taylor", nicely: false)



// Variadic Functions
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)


// Writing Throwing Functions
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}


// Running Throwing Functions
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("you can't use that password.")
}


// Inout Parameters
// All parameters passed into a Swift function are constants, so you can't change them. Inout makes the changes inside the function to be reflected to the original value outside the function
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10  // cannot use constant with inout
doubleInPlace(number: &myNum) // explicit recognition that it's being used as inout


// Functions Summary
/*
 1. Functions let us re-use code without repeating ourselves
 2. Functions can accept parameters - just tell Swift the type of each parameter.
 3. Functions can return values(need to specify what type will be sent back). Use tuples if you want to return several things
 4. You can use different names for parameters externally and internally, or omit the external name entirely
 5. Parameters can have default values, which helps you write less code when specific values are common
 6. Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array
 7. Functions can throw errors, but you must call them using try and handle errors using catch
 8. You can use inout to change variables inside a function, but it's usually better to return a new value
 */
