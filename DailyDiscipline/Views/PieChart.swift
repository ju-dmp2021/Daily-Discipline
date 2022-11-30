//
//  PieChart.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-30.
//

import SwiftUI
import Charts

enum AccountType: String{
    case checkings = "Checkings"
    case savings = "Savings"
    case brokerage = "Brokerage"
    case retirement = "Retirement"
}
struct Account: Identifiable {
    let id = UUID()
    let accountType : AccountType
    let balance: Double
}

struct PieChart: View {
    
    let accounts = [
        Account(accountType: .checkings, balance: 4500),
        Account(accountType: .savings, balance: 4500),
        Account(accountType: .retirement, balance: 4500)
    ]
    
    var body: some View {
        
        Chart{
            ForEach(accounts) { account in
                BarMark(x: .value("Account Type", account.accountType.rawValue), y: .value("Balance", account.balance))
                    .foregroundStyle(by: .value("Account Type", account.accountType.rawValue))
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
