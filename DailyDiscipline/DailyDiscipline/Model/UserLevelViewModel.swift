//
//  UserLevelViewModel.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import Foundation
import Combine


class UserLevelViewModel: ObservableObject{
    @Published var userLevelArray: [UserLevel] = []
    private var manager = CoreDataManagerUserLevel.shared
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getUserLevelArray()
        print(userLevelArray)
    }
    
    func getUserLevelArray(){
        manager.$savedUserLevel
            .receive(on: DispatchQueue.main)
            .sink { data in
                self.manager.fetchUserLevel()
                self.userLevelArray = data
            }.store(in: &cancellables)
    }
}
