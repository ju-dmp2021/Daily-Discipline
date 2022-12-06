//
//  ProfileButtonsView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct ProfileButtonsView: View {
    
    @Binding var showAchievementView: Bool
    @Binding var showTitleView: Bool
    
    var body: some View {
        HStack(spacing: 100) {
            Button {
                showAchievementView.toggle()
            } label: {
                Image(systemName: "trophy.circle")
            }
            Button {
                showTitleView.toggle()
            } label: {
                Image(systemName: "square.and.pencil.circle")
            }
        }
        .font(.system(size: 80))
        .padding(.bottom, 60)
    }
}

struct ProfileButtonsView_Previews: PreviewProvider {
    @State static var showAchievementView = false
    @State static var showTitleView = false
    static var previews: some View {
        ProfileButtonsView(showAchievementView: $showAchievementView, showTitleView: $showTitleView)
    }
}
