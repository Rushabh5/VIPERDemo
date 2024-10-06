//
//  PlantsPresenter.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import Foundation

class PlantsPresenter:NSObject {
    
    var arrPlants = [PlantsResult]()
    
    var arrClimatelist = [String]()
    var arrFilterPlants = [PlantsResult]()
    var arrClimatePlants = [PlantsResult]()
    
    
    func retrieveFromJsonFile<T: Decodable>(decodableType: T.Type) {
        
        let PlantsInteractor = PlantsInteractor<T>.init(jsonFile: "planets-ui")
        PlantsInteractor.bindDataToController = { [weak self] (jsonFile, model) in
            
            if let self = self {
                if let model = model as? PlantsResponse {
                    
                    self.arrPlants = model.results ?? [PlantsResult]()
                }
            }
        }
        PlantsInteractor.retrieveFromJsonFile()
    }
    
    func updateView() {
        retrieveFromJsonFile(decodableType: PlantsResponse.self)
    }
    
    func setUpClimateData() {
        
        arrClimatelist = BusinessLogics().getClimateList(arrPlants)
    }
    
    func filterBySelectedClimate(_ selectedText:String) {
        arrClimatePlants = BusinessLogics().filterBySelectedClimate(selectedText, list: arrPlants)
    }
}
