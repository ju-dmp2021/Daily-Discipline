//
//  PickerFrequency.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-21.
//
import SwiftUI

import SwiftUI

enum Frequency: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}

extension Frequency {
    var title: String {
        switch self {
            case .daily:
                return "Daily"
            case .weekly :
                return "Weekly"
            case .monthly:
                return "Monthly"
        }
    }
}

struct PickerFrequency: View {
    
    @Binding var selectedFrequency: Frequency
    
    var body: some View {
        
            Picker("Frequency", selection: $selectedFrequency) {
                ForEach(Frequency.allCases) { frequency in
                    Text(frequency.title).tag(frequency)
                }
            }
            .pickerStyle(.segmented)
            .frame(height: 40)
            .background(Color("NavbarBlue"))
            .cornerRadius(10)

    }
}

struct PickerFrequency_Previews: PreviewProvider {
    @State static var selectedFrequency = Frequency(rawValue: "Weekly")!
    static var previews: some View {
        PickerFrequency(selectedFrequency: $selectedFrequency)
    }
}
