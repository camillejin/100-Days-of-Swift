import UIKit

// Arithmetic Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore // 16
let difference = firstScore - secondScore // 8

let product = firstScore * secondScore // 48
let divided = firstScore / secondScore // 3
let reminder = 13 % secondScore // 1


// Operator Overloading
let meaningOfLife = 42  // 42
let doubleMeaning = 42 + 42  //84

// string + string
let fakers = "Fakers gonna "
let action = fakers + "fake" // "Fakers gonna fake"

// array + array
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
// cannot add integer to strings (type-safe)
// cannot perform addition using booleans
// cannot multiply a string array
// ** is not a built-in operator in Swift

// Compound Operators
var score = 95
score -= 5 // score = 90

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards" // "The rain in Spain falls mainly on the Spaniards"


// Comparison Operators
// cannot compare integers to doubles
let first = 6
let second = 4

first == second // false
first != score // true
first < second // false
first >= second // true

// strings have a natural alphabetical order
"Taylor" <= "Swift"


// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces A lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


// Combining Conditions
// &&: and, ||: or
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}


// The Ternary Operator
// works with three values at once
let firstNumber = 11
let secondNumber = 10
print(firstNumber == secondNumber ? "Two numbers are the same" : "The numbers are different")

if firstNumber == secondNumber {
    print("Numbers are the same")
} else {
    print("The numbers are different")
}


// Switch Statements
// should be exhaustive
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
    // swift will only run the code inside each case.
    fallthrough // execution continues on to the next case
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}


// Range Operators
let testScore = 85

switch testScore {
case 0..<50: // includes 0,1,2,... and 49, but not 50
    print("You failed badly.")
case 50..<85:  // includes 50,51, ... and 84, but not 85
    print("You did OK.")
default:
    print("You did great!")
}


// Summary
/*
 1. Swift has operators for doing arithmetic and for comparison
 2. There are compound variants of arithmetic operators that modify their variables in place +=, -=
 3. You can use if, else, and else if to run code based on the result of a condition
 4. Ternary operator combines a check with true and false code blocks
 5. Multiple conditions - may be better to use switch
 6. ..< and ... depending on whether the last number should be excluded or included
 */
