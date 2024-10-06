//
//  ViewSearchBar.swift
//  Planets
//
//  Created by Rushabh Shah on 16/10/22.
//

import UIKit

class ViewSearchBar: UIView, UITextFieldDelegate {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    
    var didTapSearch:(()->())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInilized()
    }
    
    func setupInilized() {
        Bundle.main.loadNibNamed("ViewSearchBar", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        txtSearch.delegate = self
        txtSearch.returnKeyType = UIReturnKeyType.search
        txtSearch.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtSearch {
            
            textField.resignFirstResponder()
            doneButtonClicked()
        }
        return true
    }
    
    @objc func doneButtonClicked() {
        didTapSearch?()
    }
}
