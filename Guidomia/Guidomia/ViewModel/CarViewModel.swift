//
//  CarViewModel.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-05.
//

import Foundation

struct CarViewModel {
    public var data: [Cars]?

    init() {
        data = loadJson(forName: "car_list")
    }
    
    func loadJson(forName name: String) -> [Cars]? {
        if let url = Bundle.main.url(forResource: name, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Cars].self, from: data)
                return jsonData
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
