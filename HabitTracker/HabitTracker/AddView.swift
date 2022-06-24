//
//  AddView.swift
//  HabitTracker
//
//  Created by 진승연 on 2022/06/22.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                Button("Save") {
                    let item = Activity(name: name, description: description, count: count)
                    habits.activities.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
