//
//  ActivityView.swift
//  HabitTracker
//

import SwiftUI

struct ActivityView: View {
    
    let list: Habits
    let activity: Activity
    
    var body: some View {
        //GeometryReader { geometry in
        VStack(spacing: 100) {
            VStack(alignment: .leading, spacing: 30) {
                        
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.title)
                        .background(Color.cyan.opacity(0.1))
                                
                    Text(activity.description)
                        .padding()
                }
                
                VStack(alignment: .leading) {
                    Text("Completion Status")
                        .font(.title)
                        .background(Color.cyan.opacity(0.1))

                            
                    Text("Completed \(activity.count) times")
                        .padding()
                }
                        
            }
            .padding()
            
            // how many times they have completed it
            // button incrementing their completion count
            Button("Increment") {
                var newActivity = activity
                newActivity.count += 1
                let index = list.activities.firstIndex(of: activity)!
                list.activities[index] = newActivity
            }
            
        }


        .navigationTitle(activity.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
