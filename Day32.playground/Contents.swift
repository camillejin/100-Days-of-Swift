
import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        
        /*
        .scaleEffect(animationAmount)
        //.blur(radius: (animationAmount - 1) * 3)
        
        //.animation(.default, value: animationAmount)
        // apply a default animation whenever the value of animationAmount changes
        
        //.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        
        .animation(
            .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true),
                // .repeateForever(autoreverses: true)
            value: animationAmount
        )
         */
    }
}






// Animation Bindings

/*
import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            // state change causes animation to occur
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

*/





// Creating Explicit Animations

/*
 
 import SwiftUI

 struct ContentView: View {
     @State private var animationAmount = 0.0
     
     var body: some View {
             Button("Tap Me") {
                 withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                     animationAmount += 360
                 }
             }
             .padding(50)
             .background(.red)
             .foregroundColor(.white)
             .clipShape(Circle())
             .rotation3DEffect(.degrees(animationAmount),
                               axis: (x: 0, y: 1, z: 0))
         
     }
 }

 */
