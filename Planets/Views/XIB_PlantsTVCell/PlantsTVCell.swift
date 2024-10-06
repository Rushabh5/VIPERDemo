//
//  PlantsTVCell.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import UIKit

class PlantsTVCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTerrain: UILabel!
    @IBOutlet weak var lblClimate: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblResidents: UILabel!
    
    
    var bindData: PlantsResult? {
        didSet {
            
            lblName.text = "Name: \(bindData?.name ?? "")"
            lblTerrain.text = "Terrain: \(bindData?.terrain ?? "")"
            lblClimate.text = "Climate: \(bindData?.climate ?? "")"
            lblPopulation.text = "Population: \(bindData?.population ?? "")"
            lblResidents.text = "No. Of Residents: \(bindData?.residents?.count ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
