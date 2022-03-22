import UIKit



// Variables and Constants
var name = "Tim"
name = "Tim McGraw"





// Types of Data
var name_: String
name_ = "McGraw"

var age: Int
age = 25
// name = 25 -> throws error (type safety)
// age = "Tim McGraw" -> throws error (type safety)

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333 // -86.78333 and if =-186.783333 -> -186.7833
// sacrifices less important number at the end
// Double has more accuracy than float, but still has limits

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false // type inference
// or
var missed: Bool = true





// Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var aa = 1.1
var bb = 2.2
var cc = aa + bb

var name1 = "Tim"
var name2 = "Romeo"
var both = name1 + " and " + name2 // "Tim and Romeo"

cc > 3 // true
cc >= 3  // true
cc > 4 // false
cc < 4  // true

var name3 = "Tim McGraw"
name3 == "Tim McGraw" // true ( == is case-sensitive)
name3 != "TIM McGraw"  // true (!= is case-sensitive)

stayOutTooLate // true
!stayOutTooLate // false





// String Interpolation
"Your name is \(name)"
"Your name is " + name // same thing as the above
"Your name is \(name), your name is \(age), and your latitude is \(latitude)"
// string interpolation handles different types
"Your name is \(age) years old. In another \(age) years you will be \(age*2)."
// everything between \( and ) can be a full Swift expression(operation doable)





// Arrays
var evenNumbers = [2, 4, 6, 8]
var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December"]

songs[0]
songs[1]
songs[2]

type(of: songs) // Array<String>.Type

// songs = ["Shake it Off", "You Belong with Me", "Back to December", 3]
// causes error
// var songs: [Any]  solves the problem

var songs2 = [String]()
// songs2[0] = "Shake if Off" causes error. You should append this

var alphabet1 = ["a", "b", "c"]
var alphabet2 = ["c", "d", "e"]

var both2 = alphabet1 + alphabet2
both2 += ["Everything has Changed"]

print(both)





// Dictionaries
var person = [
            "first": "Taylor",
            "middle": "Alison",
            "last": "Swift",
            "month": "December",
            "website": "taylorswift.com"
            ]
person["middle"]
person["month"]





// Conditional Statements
var action: String
var p = "hater"

if p == "hater" {
    action = "hate"
} else if p == "player" {
    action = "play"
} else {
    action = "cruise"
}
// only one of the blocks are going to get executed

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}





// Loops
for i in 1...10 { // i includes 10
    print("\(i) * 10 is \(i) * 10)")
}

var str = "Fakers gonna"
for _ in 1...5 {
    str += " fake"
}
print(str)

1 ..< 5 // 1, 2, 3, 4

for song in songs {
    print("My favorite song is \(song)")
}

var ppl = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(ppl[i]) gonna \(actions[i])")
}

for i in 0..<ppl.count {
    var str = "\(ppl[i]) gonna"
    for _ in 1...5 {
        str += "\(actions[i])"
    }
    print(str)
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1
    if counter == 556 {
        break
    }
}

for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    print("My favorite song is \(song)")
}





// Switch Case
let liveAlbums = 2
switch liveAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("Yo're a rising star!")
case 4...8:
    print("You're world famous!")
default: // swift cases need to be exhaustive
    print("Have you done something new?")
}
