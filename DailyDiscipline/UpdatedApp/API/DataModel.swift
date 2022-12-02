//
//  DataModel.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-28.
//

import Foundation
import Combine


struct OpenBoeredAPIResults: Decodable {
    let activity : String
    let key: String
    let type: String
}

class DataModel: ObservableObject {
    private var urlString = "https://www.boredapi.com/api/activity/"
    private var cancellable: Cancellable?
    private let jsonDecoder = JSONDecoder()
    
    
    @Published var activity: String?
    @Published var key: String?
    @Published var type: String?
    
    init (){
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func loadRandomTask() {
        guard let url = URL(string: urlString) else {
            return
        }
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{ element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode < 400 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: OpenBoeredAPIResults.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
        
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: {[weak self] data in
                self?.activity = data.activity
                self?.key = data.key
                self?.type = data.type
            })
    }
    
    func getTaskFromCategory(type: String){
        urlString = "https://www.boredapi.com/api/activity?type=\(type)"
        print(urlString)
        loadRandomTask()
    }
    
}
