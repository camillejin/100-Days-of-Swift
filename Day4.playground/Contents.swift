import UIKit


// For Loops
let count = 1...10
for number in count {
    print("Number is \(number)")
}
// you cannot loop over a tuple, but can loop over an array
let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}
print("Players gonna")
for _ in 1...5 {
    print("play")
}


// While Loops
var n = 1
while n <= 20 {
    print(n)
    n += 1
}
print("Ready or not, here I come!")


// Repeat Loops
var number = 1
repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

while false {
    print("This is false")
}

repeat {
    print("this is false")
} while false


// Exiting Loops
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break // the rest of the loop gets skipped
    }
    countDown -= 1
}
print("Blast off!")


// Exiting Multiple Loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop // exit both loops at the same time
        }
    }
}


// Skipping Items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}


// Infinite Loops
var counter = 0
while true {
    print(" ")
    counter += 1
    if counter == 273 {
        break
    }
}


// Looping Summary
/*
 1. Loops let us repeat code until a condition is false
 2. The most common loop is for loop, which assigns each item inside the loop to a temporary constant
 3. If you don't need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work
 4. While loops - you have to provide explicit condition to check
 5. Repeat loops - always run the body of their loop at least once
 6. Exit a single loop using break, but if you have nested loops, you need to use break followed by whatever label you placed before your outer loop
 7. You can skip items in a loop using continue
 8. Infinite loops don't end until you ask them to. (while true) Make sure you have a condition somewhere to end your infinite loops
 */
