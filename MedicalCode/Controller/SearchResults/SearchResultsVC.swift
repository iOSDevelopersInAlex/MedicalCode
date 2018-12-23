//
//  SearchResultsVC.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/23/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController {

    @IBOutlet weak var sortBy_TF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let cellIdentifier = "ClinicsCell"
    let pickerView = UIPickerView()
    var criteriaArr: [String]!
    var selectedCriteria = "0"


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        self.criteriaArr = ["الرسوم", "درجة التقييم", "الاقرب"]
        self.setUpViews()
    }

    // MARK: - Helper Functions
    private func setUpViews() {
        self.setViewControllerTitle(to: "نتيجة البحث")
        self.addSettingsBtn()
        self.addCustomBackButton()
        sortBy_TF.setRightPaddingPoints(20)
        sortBy_TF.setLeftPaddingPoints(20)
        sortBy_TF.inputView = pickerView
        createToolbar()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.isOpaque = false
//        self.noResultsImageView.image = noResultsImageView.image!.withRenderingMode(.alwaysTemplate)
//        self.noResultsImageView.tintColor = UIColor.white
    }
    
    private func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "تم", style: .plain, target: self, action: #selector(doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "الغاء", style: .plain, target: self, action: #selector(cancelClicked))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        sortBy_TF.inputAccessoryView = toolbar
    }
    @objc func doneClicked() {
        if selectedCriteria != "0" {
            sortBy_TF.text = "رتب حسب" + " :  " + self.criteriaArr[Int(self.selectedCriteria)! - 1]
        }
        sortBy_TF.resignFirstResponder()
    }
    
    @objc func cancelClicked() {
        sortBy_TF.resignFirstResponder()
    }
    
    func restartMarqueeLabels() {
        for cell in tableView.visibleCells {
            if let cell = cell as? ClinicsCell {
                if let doctorNameLabel = cell.doctorName_lbl, let doctorTitlelabel = cell.doctorTitle_lbl, let subSpecialistyLabel = cell.subSpecialisties_lb, let addressLabel = cell.address_lbl {
                    let marqueeLabels = [doctorNameLabel, doctorTitlelabel, subSpecialistyLabel, addressLabel]
                    for label in marqueeLabels {
                        label.type = .continuousReverse
                        label.speed = .duration(28)
                        label.restartLabel()
                    }
                }
            }
        }
    }
    
}
extension SearchResultsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClinicsCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        self.restartMarqueeLabels()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
}
// MARK: - UIPiker View Delegate & Data Source
extension SearchResultsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int{
        return self.criteriaArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.criteriaArr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            self.selectedCriteria = "1"
        case 1:
            self.selectedCriteria = "2"
        case 2:
            self.selectedCriteria = "3"
        default:
            self.selectedCriteria = "0"
            
        }
    }
    
}
