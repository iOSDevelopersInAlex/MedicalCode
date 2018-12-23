//
//  SearchVC.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/20/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var specaliazation_TF: UITextField!
    @IBOutlet weak var city_TF: UITextField!
    @IBOutlet weak var region_TF: UITextField!
    @IBOutlet weak var companies_TF: UITextField!
    @IBOutlet weak var doctorName_TF: UITextField!
    
    
    var active_txtField: UITextField!
    let dataPickerView = UIPickerView()
    var selectedSpecialization: String?
    var selectedSpecializationID: Int = 0
    var selectedInsuranceCompany: String?
    var selectedInsuranceID: Int = 0
    var selectedCity: String?
    var selectedCityID: Int = 0
    var selectedRegion: String?
    var selectedRegionID: Int = 0
    var itemSelected = false
    
    var specaliazationArr: [String]!
    var cityArr: [String]!
    var regionArr: [String]!
    var companiesArr: [String]!
    var serviceId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViews()
        specaliazationArr = ["اطفال","عظام","جراحة","باطنة"]
        cityArr = ["بورسعيد","المنوفية","القاهرة","اسكندرية"]
        regionArr = ["تلا","الزمالك","سموحة","عجمي"]
        companiesArr = ["ميديكال كود","مصر للتأمين","اكسا","ميد نت"]
    }

    // MARK: - Helper functions
    private func setUpViews() {
        self.setViewControllerTitle(to: "بحث")
        self.addNavItems()
        specaliazation_TF.delegate = self
        companies_TF.delegate = self
        city_TF.delegate = self
        region_TF.delegate = self
        specaliazation_TF.inputView = dataPickerView
        companies_TF.inputView = dataPickerView
        city_TF.inputView = dataPickerView
        region_TF.inputView = dataPickerView
        createToolbar()
        dataPickerView.delegate = self
        dataPickerView.dataSource = self
    }
    
    private func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "cancelPicker", style: .plain, target: self, action: #selector(cancelClicked))
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        
        specaliazation_TF.inputAccessoryView = toolbar
        companies_TF.inputAccessoryView = toolbar
        city_TF.inputAccessoryView = toolbar
        region_TF.inputAccessoryView = toolbar
    }
    @objc func doneClicked() {
        switch active_txtField {
        case specaliazation_TF:
            if let selectedSpecialization = selectedSpecialization {
                active_txtField.text = selectedSpecialization
                //self.selectedSpecializationID = viewModel.getSpecalizationId(with: selectedSpecialization)
            }
        case companies_TF:
            if let selectedInsuranceCompany = selectedInsuranceCompany {
                active_txtField.text = selectedInsuranceCompany
                //self.selectedInsuranceID = viewModel.getInsuranceId(with: selectedInsuranceCompany)
            }
        case city_TF:
            if let selectedCity = selectedCity {
                active_txtField.text = selectedCity
                region_TF.text = "ChooseRegion"
//                self.selectedCityID = viewModel.getCityId(with: selectedCity)
//                self.viewModel.setFilteredRegionsArr(cityId: selectedCityID)
            }
        case region_TF:
            if let selectedRegion = selectedRegion {
                active_txtField.text = selectedRegion
                //self.selectedRegionID = viewModel.getRegionId(with: selectedRegion)
            }
        default:
            return
        }
        active_txtField.resignFirstResponder()
        print("<---- selectedSpecializationID", self.selectedSpecializationID)
        print("<---- selectedCityID", self.selectedCityID)
        print("<---- selectedRegionID", self.selectedRegionID)
        print("<---- selectedInsuranceID", self.selectedInsuranceID)
        
    }
    
    @objc func cancelClicked() {
        if (active_txtField.text?.isEmpty)! {
            active_txtField.text = ""
        }
        active_txtField.resignFirstResponder()
    }
    
    @IBAction func findDoctorBtnPressed(_ sender: UIButton) {
        let searchResultVC = UIStoryboard(name: "SearchResults", bundle: nil).instantiateViewController(withIdentifier: "SearchResultsVC") as! SearchResultsVC
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
}

// MARK: - UIPiker View Delegate & Data Source
extension SearchVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->Int{
        
        switch active_txtField {
        case specaliazation_TF:
            return self.specaliazationArr.count
        case companies_TF:
            return self.companiesArr.count
        case city_TF:
            return self.cityArr.count
        case region_TF:
            return self.regionArr.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch active_txtField {
        case specaliazation_TF:
            return specaliazationArr[row]
        case companies_TF:
            return companiesArr[row]
        case city_TF:
            return cityArr[row]
        case region_TF:
            return regionArr[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // to open dataPicker on first item next time not selected item
        self.itemSelected = true
        switch active_txtField {
        case specaliazation_TF:
            selectedSpecialization = specaliazationArr[row]
        case companies_TF:
            selectedInsuranceCompany = companiesArr[row]
        case city_TF:
            selectedCity = cityArr[row]
        case region_TF:
            selectedRegion = regionArr[row]
        default:
            return
        }
    }
    
}
extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if self.itemSelected {
            dataPickerView.selectRow(0, inComponent: 0, animated: true)
        }
        active_txtField = textField
        dataPickerView.reloadAllComponents()
        return true
    }
    
}
