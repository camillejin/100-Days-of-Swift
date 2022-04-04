//
//  ContentView.swift
//  CustomViewModifier
//
//  Created by 진승연 on 2022/04/04.
//

import SwiftUI

struct custom: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            Text(text)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(5)
        }
    }
}

extension View {
    func customized(with text: String) -> some View {
        modifier(custom(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        Color.black
            .customized(with: "My App")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
