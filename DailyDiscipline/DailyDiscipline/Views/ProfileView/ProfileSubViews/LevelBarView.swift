//
//  LevelBarView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct LevelBarView: View {
    var moduloLevel: Float
    var body: some View {
        ZStack(alignment:.leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: CGFloat(moduloLevel * 20), height: 20)
            RoundedRectangle(cornerRadius: 10)
                .opacity(0)
                .frame(width: 200, height: 20)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 2))
        }
    }
}

struct LevelBarView_Previews: PreviewProvider {
    static var previews: some View {
        LevelBarView(moduloLevel: 1)
    }
}
