import SwiftUI

// Using stacks to arrange views
/*
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack {
                Text("7")
                Text("8")
                Text("9")
            }
        }
    }
}
*/



// Colors and frames
/*
struct ContentView: View {
    var body: some View {
        ZStack { // stack fits its content
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundColor(.secondary)
            //  .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            // Color(red: 1, green: 0.8, blue: 0)
            /*
             Color.blue
             Color.secondary
             */
            // Color.primary
            // Color.secondary
            // Color.red
            //    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            // Text("Your content")
        }
        // .ignoresSafeArea()
    }
}
*/




// Gradients
/*
struct ContentView: View {
    var body: some View {
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        /*
        RadialGradient(gradient: Gradient(colors: [.blue, .black]),
                       center: .center, startRadius: 20, endRadius: 200)
        */
        /*
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55)
            ]), startPoint: .top, endPoint: .bottom)
         */
    }
}
 */



// Buttons and images
/*
struct ContentView: View {
    var body: some View {
        /*
        Button {
            print("Edit button was tapped!")
        } label: {
            Label("Edit", systemImage: "pencil")
        }
         */
        Image(systemName: "pencil")
            .renderingMode(.original)
        /*
        Button {
            print("Button was tapped!")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }
         */
        /*
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
        }
         */
        // Button("Delete selection", role: .destructive, action: executeDelete)
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}
*/




// Showing Alert Messages
/*
struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this")
        }
    }
}
 */
