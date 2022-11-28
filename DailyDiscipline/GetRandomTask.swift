//
//  GetRandomTask.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-19.
//

import SwiftUI



struct GetRandomTask: View {
    
    
    var body: some View {
        Button {
            
        } label: {
            Spacer()
            Text("Get random task!") // API call
                .padding(10)
                .background(Color("NavbarBlue"))
                .cornerRadius(10)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct GetRandomTask_Previews: PreviewProvider {
    static var previews: some View {
        GetRandomTask()
    }
}
