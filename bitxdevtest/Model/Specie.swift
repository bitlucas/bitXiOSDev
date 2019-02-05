//
//  Specie.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 04/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class Specie: Codable {
    var name:             String?
    var classification:   String?
    var designation:      String?
    var average_height:   String?
    var skin_colors:      String?
    var hair_colors:      String?
    var eye_colors:       String?
    var average_lifespan: String?
    var homeworld:        String?
    var language:         String?
    var people:           [String]?
    var films:            [String]?
    var created:          String?
    var edited:           String?
    var url:              String?
}
