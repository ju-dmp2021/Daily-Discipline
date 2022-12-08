//
//  ProfileView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var userLevelManager = CoreDataManagerUserLevel.shared
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    @State var showAchievementView = false
    @State var showTitleView = false

    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundImageView(color: .white)
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top, 130)
                    Text("Username")
                    Text("Level: \(userLevelViewModel.getCalculatedLevel())")

                    LevelBarView(moduloLevel: userLevelViewModel.getModuloExperience())
                    
                    ProfileButtonsView(showAchievementView: $showAchievementView, showTitleView: $showTitleView)
                        .padding(.top, 60)
                }
                .foregroundColor(.black)
                .toolBarView(leftButton: "backButton", bgColor: .white)
                .foregroundColor(.white)
                .accentColor(.white)
                .sheet(isPresented: $showAchievementView) {
                    AchievementView()
                }
                .sheet(isPresented: $showTitleView) {
                    TitleView()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
