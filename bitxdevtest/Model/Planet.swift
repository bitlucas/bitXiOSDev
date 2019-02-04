//
//  PlanetModel.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 03/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class Planet :          Codable {
    var name:            String?
    var rotation_period: String?
    var orbital_period:  String?
    var diameter:        String?
    var climate:         String?
    var gravity:         String?
    var terrain:         String?
    var surface_water:   String?
    var population:      String?
    var residents:       [String]?
    var films:           [String]?
    var created:         String?
    var edited:          String?
    var url:             String?
    
}
