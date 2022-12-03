//
//  Navbar.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct Navbar: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showOptionsView : Bool
    
    var leftIcon: String
    var text: String
    
    var body: some View {
        HStack {
            

            if leftIcon == "backButton" {
                backButton
                    .padding()
            } else {
                profileButton
                    .padding()
            }
            Spacer()
            
            Text("\(text)")
                .font(.title)
            
            Spacer()
            
            settingButton
                .padding()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
        .background(Color("NavbarBlue"))
        .foregroundColor(.white)
        
    }
}

extension Navbar {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var settingButton: some View {
        Button {
            showOptionsView.toggle()
            print(showOptionsView)
        } label: {
            Image(systemName: "gearshape.fill")
        }
    }
    
    private var profileButton: some View {
        NavigationLink {
            ProfileView()
        } label: {
            Image(systemName: "person.crop.circle.fill")
        }
    }
}
