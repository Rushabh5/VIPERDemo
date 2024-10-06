//
//  PlantsVC.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import UIKit

class PlantsVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView! {
        didSet {
            setUpNib()
        }
    }
    
    @IBOutlet weak var viewSearchBar: ViewSearchBar! {
        didSet {
            setUpSearchCloser()
        }
    }
    
    var Presenter = PlantsPresenter()
    
    var selectedClimate = String()
    var toolBar = UIToolbar()
    var pickerClimate  = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Presenter.updateView()
    }
    
    @IBAction func didTapFilter(_ sender: Any) { filterView() }
}

//MARK: Class Methods
extension PlantsVC {
    
    func setUpNib() {
        
        let plantsNib = UINib(nibName: PlantsTVCell.identifireTableCell, bundle: nil)
        tblView.register(plantsNib, forCellReuseIdentifier: PlantsTVCell.identifireTableCell)
    }
    
    func filterView() {
        
        self.showActionsheet(title: String(), message: "Choose Option", actions: [("Cancel", .cancel),("Clear All Filter", .default), ("Filter By Climate", .default), ("Filter By Terrain", .default), ("Sort By Name, Population And Residents", .default)]) { index in
            
            if index == 1 {
                
                self.selectedClimate = String()
                self.viewSearchBar.txtSearch.text = String()
                self.tblView.reloadData()
            }
            else if index == 2 {
                
                self.setPicker() // -> Filter By Climate
            }
            else if index == 3 {
                
                // -> Filter By Terrain
            }
            else if index == 4 {
                
                // -> Sort By Name, Population And Residents
            }
        }
    }
}
