//
//  PlantsInteractor.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//
import UIKit
import Foundation

class PlantsInteractor<T: Decodable>: NSObject {
    
    private var jsonFile = String()
    private var createdModel : T?
    
    init(jsonFile: String) {

        self.jsonFile = jsonFile
    }
    
    var bindDataToController : ((_ jsonFile: String, _ model: T) -> ())?
    
    func retrieveFromJsonFile() {
        
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path) {
                
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from: jsonData as Data)
                    self.bindDataToController?(jsonFile, model)
                    
                } catch { print(jsonData) }
            }
        }
    }
}
