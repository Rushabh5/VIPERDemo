//
//  PlantsRouter.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import Foundation
import UIKit

class PlantsRouter: NSObject {
    
    func pushReferance<T: UIViewController>(controllerType: T.Type) -> T {
        let vc = T.init(nibName: T.identifireVC, bundle: nil)
        return vc
    }
}
