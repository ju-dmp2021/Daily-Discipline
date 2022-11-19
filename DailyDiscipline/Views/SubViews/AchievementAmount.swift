//
//  AchievementAmount.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-19.
//

import SwiftUI

struct AchievementAmount: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 26) {
            HStack {
                Image(systemName: "medal.fill")
                Text("6")
                    .padding(.trailing)
                VStack (alignment: .leading, spacing: 2) {
                    Text("Easy")
                    Image("Bar")
                }
            }
            HStack {
                Image(systemName: "medal.fill")
                Text("3")
                    .padding(.trailing)
                VStack (alignment: .leading, spacing: 2) {
                    Text("Medium")
                    Image("Bar")
                }
            }
            HStack {
                Image(systemName: "medal.fill")
                Text("2")
                    .padding(.trailing)
                VStack (alignment: .leading, spacing: 2) {
                    Text("Hard")
                    Image("Bar")
                }
            }
            
        }
        .padding()
        .frame(width: 320, height: 170, alignment: .leading)
        .background(Color("NavbarBlue"))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}


struct AchievementAmount_Previews: PreviewProvider {
    static var previews: some View {
        AchievementAmount()
    }
}
