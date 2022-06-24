//
//  ContentView.swift
//  HabitTracker
//
//  Created by 진승연 on 2022/05/19.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var habits = Habits()
    @State private var showAddActivity = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                List {
                    ForEach(habits.activities, id: \.id) { activity in
                        NavigationLink {
                            ActivityView(list: habits, activity: activity)
                        } label : {
                            Text(activity.name)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
            
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .frame(height: 800)
                .listStyle(.plain)
                
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showAddActivity = true
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddActivity) {
                AddView(habits: habits)
            }

        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
