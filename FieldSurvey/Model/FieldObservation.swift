//
//  FieldObservation.swift
//  FieldSurvey
//
//  Created by Brock Gibson on 11/13/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import Foundation
import UIKit

enum Classification: String, Codable {
    case amphibian
    case bird
    case reptile
    case fish
    case plant
    case insect
    case mammal
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}

struct FieldObservationSet: Codable {
    var status: String
    var observations: [Observation]
    
    enum CodingKeys: String, CodingKey {
        case status
        case observations
    }
}

struct Observation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case classification
        case title
        case description
        case date
    }
}

