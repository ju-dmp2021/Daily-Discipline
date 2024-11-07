//
//  CalenderView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        Text(Date.now, format: .dateTime.weekday())
            .fontDesign(.serif)
            .fontWeight(.semibold)
            .font(.system(size: 30))
            .padding(.top)
            .textInputAutocapitalization(.words)
        Text(Date.now, format: .dateTime.day(.defaultDigits))
            .fontDesign(.serif)
            .font(.system(size: 75))
            .underline()
            .offset(x: 0, y: -5)
        Text(Date.now, format: .dateTime.month(.wide))
            .fontDesign(.serif)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .textInputAutocapitalization(.words)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
