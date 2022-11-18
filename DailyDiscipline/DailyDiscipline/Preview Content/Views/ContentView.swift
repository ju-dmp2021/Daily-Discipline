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
            HStack {
                Text("Test")
                
                    .navigationTitle("My List")
                    .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: ContentView()))
                    .navigationBarTitleDisplayMode(.inline)
                    .font(.system(size: 20))
            }
            
        }
        .accentColor(Color(.label))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
