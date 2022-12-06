//
//  ProfileView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Text("Username")
                    Text("Level:")
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .frame(width: 200, height: 20)
                    HStack(spacing: 100) {
                        Image(systemName: "trophy")
                        Image(systemName: "medal")
                    }
                }
                .foregroundColor(.black)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
