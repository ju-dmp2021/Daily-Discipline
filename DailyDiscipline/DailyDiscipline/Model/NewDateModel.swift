//
//  CheckForNewDateModel.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import Foundation
import SwiftUI

class NewDateModel {
    
    func getDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let dateInString = dateFormatter.string(from: date)
        return dateInString
    }

    func dayHasChanged() -> Bool {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let dateInString = dateFormatter.string(from: date)
        
        if dateInString != UserDefaults.standard.string(forKey: "day"){
            return true
        }
        return false
    }
    
    func weekHasChanged() -> Bool{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ww"
        let dateInString = dateFormatter.string(from: date)
        
        if dateInString != UserDefaults.standard.string(forKey: "week"){
            return true
        }
        return false
    }
    
    func monthHasChanged() -> Bool{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let dateInString = dateFormatter.string(from: date)
        
        if dateInString != UserDefaults.standard.string(forKey: "month"){
            return true
        }
        return false
    }

    func saveDate(){
        let date = Date()
        let dateFormatterToDay = DateFormatter()
        let dateFormatterToWeek = DateFormatter()
        let dateFormatterToMonth = DateFormatter()
        
        dateFormatterToDay.dateFormat = "dd"
        dateFormatterToWeek.dateFormat = "ww"
        dateFormatterToMonth.dateFormat = "MM"
        
        let dayInString = dateFormatterToDay.string(from: date)
        let WeekInString = dateFormatterToWeek.string(from: date)
        let MonthInString = dateFormatterToMonth.string(from: date)
        
        UserDefaults.standard.set(dayInString, forKey: "day")
        UserDefaults.standard.set(WeekInString, forKey: "week")
        UserDefaults.standard.set(MonthInString, forKey: "month")
    }
}
