//
//  AchievementView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct AchievementView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var userLevelManager = CoreDataManagerUserLevel.shared
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    
    var achievements = [
        Achievement(title: "Level 1", category: "Progress", description: "Reach level 1", level: 1),
        Achievement(title: "Level 2", category: "Progress", description: "Reach level 2", level: 2),
        Achievement(title: "Level 3", category: "Progress", description: "Reach level 3", level: 3),
        Achievement(title: "Level 4", category: "Progress", description: "Reach level 4", level: 4),
        Achievement(title: "Level 5", category: "Progress", description: "Reach level 5", level: 5),
        Achievement(title: "Level 6", category: "Progress", description: "Reach level 6", level: 6),
        Achievement(title: "Level 7", category: "Progress", description: "Reach level 7", level: 7),
        Achievement(title: "Level 8", category: "Progress", description: "Reach level 8", level: 8),
        Achievement(title: "Level 9", category: "Progress", description: "Reach level 9", level: 9),
        Achievement(title: "Level 10", category: "Progress", description: "Reach level 10", level: 10)
    ]
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                
                Image("bgBlack")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Titles!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            ForEach(achievements) { achievement in
                                
                                ZStack{
                                    if !(achievement.level <= userLevelViewModel.getCalculatedLevel()) {
                                        Text("LOCKED")
                                            .foregroundColor(.white)
                                            .font(.system(size: 50))
                                            .rotationEffect(.degrees(-30))
                                            .opacity(0.9)
                                    }
                                    VStack{
                                        Text(achievement.title)
                                        Text(achievement.category)
                                        Text(achievement.description)
                                            .font(.subheadline)
                                    }
                                    
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 300, height: 150)
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 3))
                                    .background(
                                        
                                        LinearGradient(
                                            colors: [.white, .black, .white],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                        .cornerRadius(20)
                                        
                                        .opacity(0.5)
                                        
                                    )
                                    .opacity((achievement.level <= userLevelViewModel.getCalculatedLevel()) ? 1 : 0.3)
                                    
                                }
                                
                            }
                            
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                    }
                }
                .navigationTitle("Daily Discipline")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(.white)
                .accentColor(.white)
            }
       }
   }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView()
    }
}

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let description: String
    let level: Int
}
