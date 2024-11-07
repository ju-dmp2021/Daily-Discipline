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
    
    @State var storedData = StoredData()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                BackgroundImageView(color: .black)
                VStack{
                    Text("Achievements!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            ForEach(storedData.achievements) { achievement in
                                AchievementListView(achievement: achievement)
                            }
                        }
                    }
                }
                .toolBarView(leftButton: "backButton", bgColor: .black)
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
