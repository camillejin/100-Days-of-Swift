//
//  ListLayout.swift
//  Moonshot
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                }
            }
            .frame(height: 800)
            // scrollview 안에 scrollview인 list를 사용했기 때문에 frame 설정 안해줄시 0으로 변함
            .listStyle(.plain)
            .listRowBackground(Color.darkBackground)
    }
}
