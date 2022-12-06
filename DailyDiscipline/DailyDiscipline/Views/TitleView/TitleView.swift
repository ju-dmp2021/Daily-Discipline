//
//  TitleView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct TitleView: View {
    
    @Environment(\.dismiss) private var dismiss
    let achievements = [
           Achievement(title: "Level 2", isAchieved: true, category: "Progress", description: "Reach level 2"),
           Achievement(title: "Level 3", isAchieved: false, category: "Progress", description: "Reach level 3")
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
                    Text("Achievements!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            ForEach(achievements) { achievement in
                                
                                ZStack{
                                    if achievement.isAchieved == false{
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
                                    .opacity(achievement.isAchieved ? 1 : 0.3)
                                    
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

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

struct Achievement: Identifiable {
    let id: String
    let title: String
    let isAchieved:Bool
    let category: String
    let description: String
    
    
    init(id: String = UUID().uuidString, title: String, isAchieved: Bool, category: String, description: String) {
        self.id = id
        self.title = title
        self.isAchieved = isAchieved
        self.category = category
        self.description = description
    }
}
