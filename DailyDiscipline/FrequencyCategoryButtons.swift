//
//  FrequencyCategoryButtons.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-19.
//

import SwiftUI

struct FrequencyCategoryButtons: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button  {
                    
                } label: {
                    Text("Daily")
                        .frame(width: 80)
                        .padding(12)
                        .background(Color("NavbarBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black))
                    
                }
                Button  {
                    
                } label: {
                    Text("Weekly")
                        .frame(width: 80)
                        .padding(12)
                        .background(Color("NavbarBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black))
                    
                }
                Button  {
                    
                } label: {
                    Text("Monthly")
                        .frame(width: 80)
                        .padding(12)
                        .background(Color("NavbarBlue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black))
                    
                }
                Spacer()
            }
            Button {
                // NavigationLink
            } label: {
                Text("None of the above...")
            }

        }
    }
}


struct FrequencyCategoryButtons_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyCategoryButtons()
    }
}
