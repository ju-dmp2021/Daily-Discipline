//
//  AchievementsView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Navbar(leftIcon: "backButton", text: "Achievements")
                    Spacer()
                    
                    AchievementAmount()
                    Spacer()

                    Button {
                        
                    } label: {
                        Text("See locked achievements...")
                    }

                    
                    Spacer()
                    WaveBottom(isAtMyTasks: false)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AchievementsView()
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}
