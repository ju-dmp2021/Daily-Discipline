//
//  TitleListView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct TitleListView: View {
    
    var title: Title
    
    var body: some View {
        ZStack{
            if title.isAchieved == false{
                Text("LOCKED")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .rotationEffect(.degrees(-30))
                    .opacity(0.9)
            }
            VStack{
                Text(title.title)
                Text(title.category)
                Text(title.description)
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
            .opacity(title.isAchieved ? 1 : 0.3)
        }
    }
}
