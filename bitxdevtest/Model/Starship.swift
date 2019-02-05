//
//  Starship.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 04/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class Starship : Codable {
    var name:                   String?
    var model:                  String?
    var manufacturer:           String?
    var cost_in_credits:        String?
    var length:                 String?
    var max_atmosphering_speed: String?
    var crew:                   String?
    var passengers:             String?
    var cargo_capacity:         String?
    var consumables:            String?
    var hyperdrive_rating:      String?
    var MGLT:                   String?
    var starship_class:         String?
    var pilots:                 [String]?
    var films:                  [String]?
    var created:                String?
    var edited:                 String?
    var url:                    String?
}
