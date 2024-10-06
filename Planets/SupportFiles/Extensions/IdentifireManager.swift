//
//  IdentifireManager.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import UIKit
import Foundation

extension UIViewController {
    static var identifireVC:String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifireTableCell:String {
        return String(describing: self)
    }
}
