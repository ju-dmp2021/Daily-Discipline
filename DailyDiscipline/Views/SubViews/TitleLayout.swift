//
//  TitleLayout.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-19.
//

import SwiftUI

struct TitleLayout: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dumbbell.fill")
                Spacer()
            }
            VStack {
                Text("Title")
                    .font(.headline)
                    .underline()
                Text("Description")
                    .font(.system(size: 14))
            }
            .padding(.bottom, 2)
            HStack {
                Spacer()
                Text("Category: Fitness")
                    .font(.footnote)
            }
        }
        .padding()
        .frame(width: 320, height: 100)
        .background(Color("NavbarBlue"))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}


struct TitleLayout_Previews: PreviewProvider {
    static var previews: some View {
        TitleLayout()
    }
}
