//
//  BusinessLogics.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import Foundation

class BusinessLogics: NSObject {
    
    func filterByName(_ searchText:String, list:[PlantsResult]) -> [PlantsResult] {
        
        let filtered = list.filter { (($0.name ?? "").lowercased()).contains(searchText.lowercased()) }
        return filtered
    }
    
    func getClimateList(_ list:[PlantsResult]) -> [String] {

        let selectedItems: Set<String> = Set(list.map { $0.climate ?? "" })
        return [String](selectedItems)
    }
    
    func filterBySelectedClimate(_ text:String, list:[PlantsResult]) -> [PlantsResult] {
        
        let filtered = list.filter { (($0.climate ?? "")).contains(text) }
        return filtered
    }
}
