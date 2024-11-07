//
//  DailyDisciplineTests.swift
//  DailyDisciplineTests
//
//  Created by Harry Karl Filip Karlsson on 2022-12-08.
//

import XCTest
import Combine
@testable import DailyDiscipline

final class DailyDisciplineTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_hasDayChanged_ShouldBeTrue() throws {
        let newDateModel = NewDateModel()
        let date = Date.now.addingTimeInterval(-86400)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let dateInString = dateFormatter.string(from: date)
        UserDefaults.standard.set(dateInString, forKey: "day")
        
        XCTAssert(newDateModel.dayHasChanged())
    }
    
    func test_hasDayChanged_ShouldBeFlase() throws {
        let newDateModel = NewDateModel()
        newDateModel.saveDate()
        
        XCTAssert(!newDateModel.dayHasChanged())
        
    }
    func test_hasWeekChanged_ShouldBeTrue() throws {
        let newDateModel = NewDateModel()
        let date = Date.now.addingTimeInterval(-604800)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ww"
        let dateInString = dateFormatter.string(from: date)
        UserDefaults.standard.set(dateInString, forKey: "week")
        
        XCTAssert(newDateModel.weekHasChanged())
    }
    
    func test_hasWeekChanged_ShouldBeFlase() throws {
        let newDateModel = NewDateModel()
        newDateModel.saveDate()
        
        XCTAssert(!newDateModel.weekHasChanged())
        
    }
    func test_hasMonthChanged_ShouldBeTrue() throws {
        let newDateModel = NewDateModel()
        let date = Date.now.addingTimeInterval(-2592000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let dateInString = dateFormatter.string(from: date)
        UserDefaults.standard.set(dateInString, forKey: "month")
        
        XCTAssert(newDateModel.monthHasChanged())
    }
    
    func test_hasMonthChanged_ShouldBeFlase() throws {
        let newDateModel = NewDateModel()
        newDateModel.saveDate()
        
        XCTAssert(!newDateModel.monthHasChanged())
        
    }
    
    func test_hasGottenEXP_ShouldBeTrue(){
        let coreDataManagerUserLevel = CoreDataManagerUserLevel()
        coreDataManagerUserLevel.savedUserLevel[0].exp = 0
        let currentEXP = coreDataManagerUserLevel.getUserExperience()
        
        coreDataManagerUserLevel.addUserExperience(points: 10)
        XCTAssert(currentEXP < coreDataManagerUserLevel.getUserExperience())
        XCTAssert(coreDataManagerUserLevel.getUserExperience() == 10)
        
    }

    func test_hasLeveledUp_ShouldBeTrue(){
        let coreDataManagerUserLevel = CoreDataManagerUserLevel()
        coreDataManagerUserLevel.savedUserLevel[0].exp = 0
        let currentLevel = coreDataManagerUserLevel.getCalculatedLevel()
        
        coreDataManagerUserLevel.addUserExperience(points: 100)
        
        XCTAssert(coreDataManagerUserLevel.getCalculatedLevel() > currentLevel)
        XCTAssert(coreDataManagerUserLevel.getCalculatedLevel() == 11)
    }
    
    func test_getModuloExperience_ShouldBeTrue(){
        let coreDataManagerUserLevel = CoreDataManagerUserLevel()
        coreDataManagerUserLevel.savedUserLevel[0].exp = 0
        coreDataManagerUserLevel.addUserExperience(points: 111)
        
        XCTAssert(coreDataManagerUserLevel.getModuloExperience() == 1)
        }
    
    func test_GetsContentFromAPI_ShouldBeTrue(){
        
        let apiDataModel = ApiDataModel()
        apiDataModel.getTaskFromCategory(type: "cooking")
        var task = ""
        var error: Error?
        let expectation = self.expectation(description: "")
        apiDataModel.$activity.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            
        }, receiveValue: { value in
            if value != nil{
                expectation.fulfill()
            }
            else{
                
            }
        })
        .store(in: &cancellables)
        waitForExpectations(timeout: 5)
        
        task = apiDataModel.activity ?? ""
        
        XCTAssert(task != "")
    }

}
