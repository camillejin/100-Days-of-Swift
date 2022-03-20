import UIKit
import Foundation


// Creating Your Own Classes
// Classes never come with a memberwise initializer
class Dog {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")


// Class Inheritance
// inherits the same properties and initializer as Dog by default
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}


// Overriding Methods
class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}
class Poodle2: Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
}
let poppy2 = Poodle2()
poppy2.makeNoise()


// Final Classes
// no other class can inherit from it
final class Dog3 {
}


// Copying Objects
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Justin Bieber"
// both singer and singerCopy point to the same object in memory
print(singer.name) // Justin Bieber
// If Singer were a struct, we would get Taylor Swift the second time


// Deinitializers
class Person {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit { // gets run when an instance of a class is destroyed
        print("\(name) is no more!")
    }
}
for _ in 1...3 {
    // each time the loop goes around, a new person will be created then destroyed
    let person = Person()
    person.printGreeting()
}


// Mutability
// If you have a constant struct with var property, that property can't be changed because struct itself is constant
// If you have a constant class with var property, that property can be changed
// Classes don't need the mutating keyword with methods that change properties
class Singer2 {
    var name = "Taylor Swift"
}
let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)


// Classes summary
/*
 1. Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 2. One class can inherit from another, and it gains all the properties and methods of the parent class.
 3. You can mark a class with the final keyword, which stops other classes from inheriting from it.
 4. Method overriding lets a child class replace a method in its parent class with a new implementation
 5. When two variables point at the same class instance, they both point at the same piece of memeory
 6. Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed
 7. Classes don't enforce constants as strongly as structs - if a property is declared as a variable, it can be changed regardless of how the class instance was created
 */
