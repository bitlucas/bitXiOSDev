//
//  ResponseModel.swift
//  bitxdevtest
//
//  Created by Lucas Bitar on 02/02/19.
//  Copyright © 2019 Lucas Bitar. All rights reserved.
//

import Foundation

class ResponseBody: Codable {
    var count:      Int?
    var next:       String?
    var previous:   String?
    var results:    [Character]?
}

class Character:    Codable {
    var name:       String?
    var height:     String?
    var mass:       String?
    var hair_color: String?
    var skin_color: String?
    var eye_color:  String?
    var birth_year: String?
    var gender:     String?
    var homeworld:  String?
    var films:      [String]?
    var species:    [String]?
    var vehicles:   [String]?
    var starships:  [String]?
    var created:    String?
    var edited:     String?
    var url:        String?
}
