//
//  WaveBottom.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct WaveBottom: View {
    
    var isAtMyTasks: Bool
    
    var body: some View {
        ZStack {
            Image("WaveBottom")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y:34)
            if isAtMyTasks == true {
                NavigationLink (destination: NewTaskView(textInput: "")) {
                    ZStack {
                        Circle()
                            .fill(Color("NavbarTopBlue"))
                        Image(systemName: "plus")
                            
                    }
                }
                .frame(width: 50, height: 50)
                .offset(x: 150, y: 65)
                .font(.system(size: 30))
                .foregroundColor(.white)
            }
        }
    }
}

struct WaveBottom_Previews: PreviewProvider {
    static var previews: some View {
        WaveBottom(isAtMyTasks: true)
    }
}
