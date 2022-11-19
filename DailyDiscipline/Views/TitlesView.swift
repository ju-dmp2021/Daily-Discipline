//
//  TitlesView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct TitlesView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Navbar(leftIcon: "arrow.backward", text: "Titles", rightIcon: "gearshape.fill")
                    Spacer()
                    
                    TitleLayout()
                    
                    Button {
                        
                    } label: {
                        Text("See locked titles...")
                    }

                    
                    Spacer()
                    WaveBottom(isAtMyTasks: false)
                }
            }
        }
    }
}

struct TitlesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TitlesView()
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}
