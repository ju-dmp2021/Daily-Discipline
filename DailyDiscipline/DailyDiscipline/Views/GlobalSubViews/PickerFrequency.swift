//
//  PickerFrequency.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import SwiftUI

enum FrequencyPicker: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}

extension FrequencyPicker {
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
    
    @Binding var selectedFrequency: FrequencyPicker
    
    var body: some View {
            
        Picker("Frequency", selection: $selectedFrequency) {
            ForEach(FrequencyPicker.allCases) { frequency in
                Text(frequency.title).tag(frequency)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 30)
        .cornerRadius(10)
        
    }
}

struct PickerFrequency_Previews: PreviewProvider {
    @State static var selectedFrequency = FrequencyPicker(rawValue: "Weekly")!
    static var previews: some View {
        PickerFrequency(selectedFrequency: $selectedFrequency)
    }
}
