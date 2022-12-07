//
//  AchievementListView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct AchievementListView: View {
    
    @State var storedData = StoredData()
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    
    var achievement: Achievement
    
    var body: some View {
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
