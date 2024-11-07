//
//  ViewModel.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import Foundation
import Combine


class TaskObjectViewModel: ObservableObject{
    @Published var dailyArray: [TaskObject] = []
    @Published var weeklyArray: [TaskObject] = []
    @Published var monthlyArray: [TaskObject] = []
    private var manager = CoreDataManagerTaskObject.shared
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getDailyData()
        getWeeklyData()
        getMonthlyData()
    }
    
    func getDailyData(){
        manager.$dailyTaskObjects
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.manager.fetchDailyTaskObjects()
                self.dailyArray = data
            }.store(in: &cancellables)
    }
    
    func getWeeklyData(){
        manager.$weeklyTaskObjects
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.manager.fetchWeeklyTaskObjects()
                self.weeklyArray = data
            }.store(in: &cancellables)
    }
    
    func getMonthlyData(){
        manager.$monthlyTaskObjects
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.manager.fetchMonthlyTaskObjects()
                self.monthlyArray = data
            }.store(in: &cancellables)
    }
}
