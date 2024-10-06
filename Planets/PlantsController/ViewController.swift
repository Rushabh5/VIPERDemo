//
//  ViewController.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            
            kSceneDelegate.swichToPlants()
        }
    }
}

