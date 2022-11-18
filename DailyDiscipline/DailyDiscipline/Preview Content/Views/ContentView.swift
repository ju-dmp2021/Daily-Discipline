//
//  ContentView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
               
                VStack {
                    Navbar(leftIcon: "person.circle.fill", text: "My List", rightIcon: "gearshape.fill")
                    Spacer()
                    
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
        /*      NavigationStack {
         HStack(spacing: 75) {
         NavigationLink("\(Image(systemName: "person.circle.fill"))", destination: ProfileView())
         .tint(.black)
         Text("My List")
         NavigationLink("\(Image(systemName: "gearshape.fill"))", destination: ProfileView())
         .tint(.black)
         }
         .frame(width: .infinity, height: 10)
         .padding(15)
         .font(.system(size: 32, weight: .bold))
         .background(.blue)
         .ignoresSafeArea()
         Spacer()
         }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
            
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}

