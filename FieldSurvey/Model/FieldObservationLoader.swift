//
//  FieldObservationLoader.swift
//  FieldSurvey
//
//  Created by Brock Gibson on 11/13/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import Foundation

class FieldObservationLoader {
    
    class func load(jsonFileName: String) -> FieldObservationSet? {
        var observationSet: FieldObservationSet?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            observationSet = try? jsonDecoder.decode(FieldObservationSet.self, from: jsonData)
        }
        
        return observationSet
    }
}
