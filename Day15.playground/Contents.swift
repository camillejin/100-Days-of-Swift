import UIKit


// Properties
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just chaged from \(oldValue) to \(clothes)")
        }
    }
}
func updateUI(msg: String ) {
    print(msg)
}
var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"
// I'm changing from T-shirts to short skirts
// I just changed from T-shirts to short skirts

struct Person2 {
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
        // To make a computed property, place an open brace after your property then use either get or set to make an action happen at the approximate time
    }
}
var fan = Person2(age: 25)
print(fan.ageInDogYears)





// Static Properties and Methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}
let fan2 = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)






// Access Control
// public, internal, file private, private
class TaylorFan2 {
    private var name: String? // your own methods can work with this property, but other can't
}





// Polymorphism and Typecasting
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots."
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots."
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots."
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless]

for album in allAlbums as! [StudioAlbum] {
    print(album.getPerformance())
    print(album.studio)
}

for album2 in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album2.getPerformance())
    print(album2.location)
}

let number = 5
let text = String(number)
print(text)






// Closures
let vw = UIView()
/*
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})
 */
UIView.animate(withDuration: 0.5) { vw.alpha = 0 }



