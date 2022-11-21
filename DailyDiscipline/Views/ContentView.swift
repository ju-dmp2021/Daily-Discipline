//
//  ContentView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks: [String] = ["Idag", "Har", "Vi"," Programmering"]
        
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Navbar(leftIcon: "profileButton", text: "My List")
                    Spacer()
                    
                    List {
                        CategoryButtonView()
                    }
                    
                    Spacer()
                    WaveBottom(isAtMyTasks: true)
                        .background(.red) // Need to make it transparant
                }
            }
            
        }
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

