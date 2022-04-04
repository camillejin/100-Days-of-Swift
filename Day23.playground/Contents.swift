import SwiftUI

// Conditional Modifier

/*
struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        
        // #1
        Button("Hello, world!") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        
        /* #2
        if useRedText {
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundColor(.red)
        } else {
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundColor(.blue)
        }
         */
        
        // #1 and #2 are identical
    }
}
*/




// Environment Modifier

/*
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
                .blur(radius: 50) // adds to the parent modifier
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 5)
    }
}
*/






// Views as Properties
/*
struct ContentView: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunguam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
            spells
    }
}
*/





// View Composition
/*
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
}
*/





// Custom Modifiers
/*
struct Watermark: ViewModifier {
    var text: String // ViewModifiers can have custom properties while extensions cannot
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        /*
        Text("Hello, world!")
            // .modifier(Title())
            .titleStyle()
         */
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}
*/






// Custom Containers
/*
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack( rows: 4, columns: 4) {row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")

        }
    }
}
*/
