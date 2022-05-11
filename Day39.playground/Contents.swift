
// Resizing images to fit the screen using GeometryReader


/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("lilac")
                .resizable()
                .scaledToFit() // internal fragmentation
                // .scaledToFill()  // external fragmentation
                .frame(width: geo.size.width * 0.8, height: 300)
                .frame(width: geo.size.width,
                       height: geo.size.height)
        }
    }
}
 */




// How ScrollView lets us work with Scrolling Data

/*
struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            // loads content on demand
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
*/



// Pushing new views onto the stack using NavigationLink

/*
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label : {
                    Text("Row \(row)")
                }
                .navigationTitle("SwiftUI")
            }
        }
    }
}
*/




// Working with hierarchical Codable data

/*
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            let data = Data(input.utf8)
            
            // convert JSON string to the Data type(which is what Codable works with)
            // then decode that into a User instance
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}
*/





// How to lay out views in a scrolling grid
/*
struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}
*/


