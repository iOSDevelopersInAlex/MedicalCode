//
//  SearchVC.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/20/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit


typealias SpecializationAlias = (id: Int, name: String)
typealias InsuranceAlias = (id: Int, name: String)
typealias CityAlias = (id: Int, name: String)
typealias RegionAlias = (id: Int, name: String, cityId: Int)

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
    
    
    var specializationArr = [SpecializationAlias]()
    var insuranceCompaniesArr = [InsuranceAlias]()
    var CitiesArr = [CityAlias]()
    var RegionsArr = [RegionAlias]()
    var filteredRegionsArr = [RegionAlias]()
    
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
        self.loadSpecalizations(for: serviceId)
        self.loadInsuranceCompanies()
        self.loadCityRegions()
    }
    
    private func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "تأكيد", style: .plain, target: self, action: #selector(doneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "الغاء", style: .plain, target: self, action: #selector(cancelClicked))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
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
                self.selectedSpecializationID = self.getSpecalizationId(with: selectedSpecialization)
            }
        case companies_TF:
            if let selectedInsuranceCompany = selectedInsuranceCompany {
                active_txtField.text = selectedInsuranceCompany
                self.selectedInsuranceID = self.getInsuranceId(with: selectedInsuranceCompany)
            }
        case city_TF:
            if let selectedCity = selectedCity {
                active_txtField.text = selectedCity
                region_TF.text = "اختر منطقة"
                self.selectedCityID = self.getCityId(with: selectedCity)
                self.setFilteredRegionsArr(cityId: selectedCityID)
            }
        case region_TF:
            if let selectedRegion = selectedRegion {
                active_txtField.text = selectedRegion
                self.selectedRegionID = self.getRegionId(with: selectedRegion)
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
    
    
    // MARK: - Specalizations functions
    func loadSpecalizations(for serviceId: Int) {
        self.specializationArr.removeAll()
        specializationArr = [SpecializationAlias( 0, "اختر الكل")]
        APIManager.getSpecalizations(serviceId: serviceId) { (error, specalizationArr) in
            if let error = error {
                self.showAlert(title: "عذرا", message: error)
                print(error)
            } else if let specalizationArr = specalizationArr {
                
                for specalization in specalizationArr {
                    self.specializationArr.append(SpecializationAlias(specalization.id ?? 0 , specalization.nameA ?? ""))
                }
                self.dataPickerView.reloadAllComponents()
            }
        }
    }
    
    func getSpecalizationsCount() -> Int {
        return specializationArr.count
    }
    
    func getSpecalizationName(at index: Int) -> String {
        if index == 0 && specializationArr.count == 0 {
            return ""
        }
        return specializationArr[index].name
    }
    
    func getSpecalizationId(with specalizationName: String) -> Int {
        guard let selectedSpecalization = specializationArr.first(where: {$0.name == specalizationName})?.id else {return 0}
        return selectedSpecalization
    }
    
    // MARK: - InsuranceCompanies functions
    func loadInsuranceCompanies() {
        self.insuranceCompaniesArr.removeAll()
        insuranceCompaniesArr = [InsuranceAlias( 0, "اختر الكل")]
        APIManager.getInsuranceCompanies { (error, insuranceCompaniesArr) in
            if let error = error {
                self.showAlert(title: "عذرا", message: error)
                print(error)
            } else if let insuranceCompaniesArr = insuranceCompaniesArr {
                
                for insuranceCompany in insuranceCompaniesArr {
                    self.insuranceCompaniesArr.append(InsuranceAlias(insuranceCompany.id ?? 0, insuranceCompany.companyNameA ?? ""))
                }
                self.dataPickerView.reloadAllComponents()
            }
        }
    }
    
    func getInsuranceCompaniesCount() -> Int {
        return insuranceCompaniesArr.count
    }
    
    func getInsuranceCompanyName(at index: Int) -> String {
        if index == 0 && insuranceCompaniesArr.count == 0 {
            return ""
        }
        return insuranceCompaniesArr[index].name
    }
    
    func getInsuranceId(with insuranceCompanyName: String) -> Int {
        guard let selectedInsuranceCompany = insuranceCompaniesArr.first(where: {$0.name == insuranceCompanyName})?.id else {return 0}
        return selectedInsuranceCompany
    }
    
    // MARK: - CityRegion functions
    func loadCityRegions() {
        self.CitiesArr.removeAll()
        self.RegionsArr.removeAll()
        CitiesArr = [CityAlias( 0, "اختر الكل")]
        APIManager.getCityRegion { (error, data) in
            if let error = error {
                self.showAlert(title: "عذرا", message: error)
                print(error)
            } else if let data = data {
                
                for item in data {
                    if !self.CitiesArr.contains(where: { $0.name == item.cityNameA ?? "" }) {
                        self.CitiesArr.append(CityAlias(item.cityId ?? 0 , item.cityNameA ?? ""))
                    }
                    self.RegionsArr.append(RegionAlias(item.regionId ?? 0, item.regionNameA ?? "", item.cityId ?? 0))
                }
                self.dataPickerView.reloadAllComponents()
            }
        }
    }
    // MARK: - Cities functions
    func getCitiesCount() -> Int {
        return CitiesArr.count
    }
    
    func getCityName(at index: Int) -> String {
        if index == 0 && CitiesArr.count == 0 {
            return ""
        }
        return CitiesArr[index].name
    }
    
    func getCityId(with cityName: String) -> Int {
        guard let selectedCity = CitiesArr.first(where: {$0.name == cityName})?.id else {return 0}
        return selectedCity
    }
    // MARK: - Regions functions
    func setFilteredRegionsArr(cityId: Int) {
        self.filteredRegionsArr.removeAll()
        self.filteredRegionsArr = [RegionAlias( 0, "اختر الكل", 0)]
        if RegionsArr.count != 0 {
            let filteredRegionsArr = self.RegionsArr.filter { $0.cityId == cityId }
            if !filteredRegionsArr.contains(where: { $0.name == "اختر الكل" }) {
                self.filteredRegionsArr.append(contentsOf: filteredRegionsArr)
            }
        }
    }
    
    func getRegionsCount() -> Int {
        return filteredRegionsArr.count
    }
    
    func getRegionName(at index: Int) -> String {
        if index == 0 && filteredRegionsArr.count == 0 {
            return ""
        }
        return filteredRegionsArr[index].name
    }
    
    func getRegionId(with regionName: String) -> Int {
        guard let selectedRegion = filteredRegionsArr.first(where: {$0.name == regionName})?.id else {return 0}
        return selectedRegion
    }

    @IBAction func findDoctorBtnPressed(_ sender: UIButton) {
        
        guard Validator.isOneFieldSelected(speciality: self.specaliazation_TF.text, city: self.city_TF.text, region: self.region_TF.text, company: self.companies_TF.text) else {
            self.showAlert(title: "عذرا", message: "يجب ان تختار عنصر واحد علي الاقل")
            return
        }
        
        let doctorName = Validator.getDoctorName(doctorName: doctorName_TF.text)
        let patientId = Helper.getPatientID() != nil ? "\(String(describing: Helper.getPatientID()!))" : nil
        let searchData = SearchData(serviceId: "\(String(describing: serviceId!))",patientId: patientId, cityId: "\(String(describing: selectedCityID))", regionId: "\(String(describing: selectedRegionID))", specialityId: "\(String(describing: selectedSpecializationID))", insuranceId: "\(String(describing: selectedInsuranceID))", doctorName: doctorName, page: "1", sortBy: "0", longitude: "", latitude: "", perpage: "3")
        
        print("<----- searchData: ",searchData.cityId, searchData.regionId, searchData.specialityId, searchData.insuranceId, doctorName)
        
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
            return self.getSpecalizationsCount()
        case companies_TF:
            return self.getInsuranceCompaniesCount()
        case city_TF:
            return self.getCitiesCount()
        case region_TF:
            return self.getRegionsCount()
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch active_txtField {
        case specaliazation_TF:
            return self.getSpecalizationName(at: row)
        case companies_TF:
            return self.getInsuranceCompanyName(at: row)
        case city_TF:
            return self.getCityName(at: row)
        case region_TF:
            return self.getRegionName(at: row)
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // to open dataPicker on first item next time not selected item
        self.itemSelected = true
        switch active_txtField {
        case specaliazation_TF:
            selectedSpecialization = self.getSpecalizationName(at: row)
        case companies_TF:
            selectedInsuranceCompany = self.getInsuranceCompanyName(at: row)
        case city_TF:
            selectedCity = self.getCityName(at: row)
        case region_TF:
            selectedRegion = self.getRegionName(at: row)
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
