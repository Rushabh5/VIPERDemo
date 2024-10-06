//
//  PlantsVC+Delegate+DataSource.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import Foundation
import UIKit

//MARK: Search Closer Setup
extension PlantsVC {
    
    func setUpSearchCloser() {
        
        viewSearchBar.didTapSearch = { [weak self] in
            
            if let self = self {
                
                self.Presenter.arrFilterPlants = BusinessLogics().filterByName((self.viewSearchBar.txtSearch.text ?? ""), list: self.Presenter.arrPlants)
                self.tblView.reloadData()
            }
        }
    }
}

//MARK: UITableView DataSource Method
extension PlantsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !(viewSearchBar.txtSearch.text ?? "").emptyChecker() {
            return Presenter.arrFilterPlants.count
        }
        else if !selectedClimate.emptyChecker() {
            return Presenter.arrClimatePlants.count
        }
        else {
            return Presenter.arrPlants.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlantsTVCell.identifireTableCell, for: indexPath) as! PlantsTVCell
        
        if !(viewSearchBar.txtSearch.text ?? "").emptyChecker()
        {
            cell.bindData = Presenter.arrFilterPlants[indexPath.row]
        }
        else if !selectedClimate.emptyChecker() {
            cell.bindData = Presenter.arrClimatePlants[indexPath.row]
        }
        else
        {
            cell.bindData = Presenter.arrPlants[indexPath.row]
        }
        
        return cell
    }
}

//MARK: UIPickerView Delegate & DataSource Methods
extension PlantsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setPicker() {
        
        Presenter.setUpClimateData()
        pickerClimate = UIPickerView.init()
        pickerClimate.delegate = self
        pickerClimate.dataSource = self
        pickerClimate.backgroundColor = UIColor.white
        pickerClimate.setValue(UIColor.black, forKey: "textColor")
        pickerClimate.autoresizingMask = .flexibleWidth
        pickerClimate.contentMode = .center
        pickerClimate.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(pickerClimate)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.backgroundColor = .white
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
        
    }
    
    @objc func onDoneButtonTapped() { toolBar.removeFromSuperview(); pickerClimate.removeFromSuperview() }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return Presenter.arrClimatelist.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return Presenter.arrClimatelist[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedClimate = (Presenter.arrClimatelist[row])
        Presenter.filterBySelectedClimate(selectedClimate)
        tblView.reloadData()
    }
}
