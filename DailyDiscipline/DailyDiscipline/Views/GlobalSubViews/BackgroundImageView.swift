//
//  BackgroundImageView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct BackgroundImageView: View {
    
    var color: Color
    
    var body: some View {
        if color == .black {
            Image("bgBlack")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        } else {
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}


struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView(color: .black)
    }
}
