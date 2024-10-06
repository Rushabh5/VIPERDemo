//
//  PlantsEntity.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import Foundation

struct PlantsResponse: Codable {
    var results: [PlantsResult]?
}

struct PlantsResult: Codable {
    
    var name, rotationPeriod, orbitalPeriod, diameter: String?
    var climate, gravity, terrain, surfaceWater: String?
    var population: String?
    var residents, films: [String]?
    var created, edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
