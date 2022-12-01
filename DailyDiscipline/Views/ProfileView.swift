//
//  ProfileView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct ProfileView: View {
    
   // @EnvironmentObject var level: LevelTracker
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Navbar(leftIcon: "backButton", text: "Profile")
                    Spacer()
                    
                    VStack {
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 180))
                            .foregroundColor(Color("NavbarBlue"))
                        Text("Username")
                            .underline()
                        Spacer()
                        Text("Level: \(vm.getCalculatedLevel())")
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(width: 200, height: 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.black, lineWidth: 2)
                            )
                        Text("EXP:")
                        Text("\(vm.level[0].exp)")
                        HStack {
                            Spacer()
                            achievementButton
                            Spacer()
                            titlesButton
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ProfileView()
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}

extension ProfileView {
    private var achievementButton: some View {
        NavigationLink {

        } label: {
            VStack {
                Image(systemName: "trophy.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("NavbarBlue"))
                Text("Acievements")
                    .foregroundColor(.black)
            }
        }
    }
    private var titlesButton: some View {
        NavigationLink {

        } label: {
            VStack {
                Image(systemName: "pencil.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("NavbarBlue"))
                Text("Titles")
                    .foregroundColor(.black)
            }
        }
    }
}
