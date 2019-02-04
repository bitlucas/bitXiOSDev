//
//  Film.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 03/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class Film : Codable {
    var title:          String?
    var episode_id:     String?
    var opening_crawl:  String?
    var director:       String?
    var producer:       String?
    var release_date:   String?
    var characters:     [String]?
    var planets:        [String]?
    var starships:      [String]?
    var vehicles:       [String]?
    var species:        [String]?
    var created:        String?
    var edited:         String?
    var url:            String?
    
}
