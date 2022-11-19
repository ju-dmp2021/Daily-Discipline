//
//  Navbar.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct Navbar: View {
    
    var leftIcon: String
    var text: String
    var rightIcon: String
    
    
    var body: some View {
        HStack {

       //     NavigationLink("\(Image(systemName: "\(leftIcon)"))", destination: ContentView())
        //        .font(.system(size: 35))
            
     /*       Button {
                
            } label: {
                Image(systemName: "\(leftIcon)")
                    .font(.system(size: 35))
            }
*/
            
            
            
            
            Spacer()
            Text("\(text)")
                .font(.system(size: 35))
            Spacer()
            NavigationLink("\(Image(systemName: "\(rightIcon)"))", destination: ContentView())
                .font(.system(size: 35))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 8)
        .background(Color("NavbarBlue"))
        .foregroundColor(.white)
    }
}
