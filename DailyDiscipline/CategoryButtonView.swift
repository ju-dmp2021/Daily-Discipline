//
//  CategoryButtonView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct CategoryButtonView: View {
    
    @State var todayIsClicked: Bool = false
    @State var weeklyIsClicked: Bool = false
    @State var monthlyIsClicked: Bool = false
    @State var tasks: [String] = ["Idag", "Har", "Vi"," Programmering"]
    
    var body: some View {
        Button {
            todayIsClicked.toggle()
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName:("chevron.down"))
                    Text("Today's tasks")
                }
            }
            .foregroundColor(.black)
        }
        DisplayTasks(todayIsClicked: todayIsClicked, weeklyIsClicked: false, monthlyIsClicked: false, tasks: tasks)
        Button {
            weeklyIsClicked.toggle()
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName:("chevron.down"))
                    Text("This week's tasks")
                }
            }
            .foregroundColor(.black)
        }
        DisplayTasks(todayIsClicked: false, weeklyIsClicked: weeklyIsClicked, monthlyIsClicked: false, tasks: tasks)
        Button {
            monthlyIsClicked.toggle()
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName:("chevron.down"))
                    Text("This month's tasks")
                }
            }
            .foregroundColor(.black)
        }
        DisplayTasks(todayIsClicked: false, weeklyIsClicked: false, monthlyIsClicked: monthlyIsClicked, tasks: tasks)
    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView()
    }
}
