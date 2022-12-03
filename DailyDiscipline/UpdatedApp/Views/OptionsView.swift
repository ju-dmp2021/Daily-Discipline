//
//  OptionsView.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-12-03.
//

import SwiftUI



struct OptionsView: View {
    var body: some View {
        ZStack(alignment: .leading){
            Color.blue
                .ignoresSafeArea(.all)
            VStack(alignment: .leading, spacing: 50){
                Button {
                    
                } label: {
                    Text("Profile")
                }.foregroundColor(.white)
                    .font(.custom("wah", size: 50))
                
                Button {
                    
                } label: {
                    Text("Help")
                }.foregroundColor(.white)
                    .font(.custom("wah", size: 50))
                
                Button {
                    
                } label: {
                    Text("Contact")
                }.foregroundColor(.white)
                    .font(.custom("wah", size: 50))
            }
            .padding(40)
            
        }
        .ignoresSafeArea(.all)
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
