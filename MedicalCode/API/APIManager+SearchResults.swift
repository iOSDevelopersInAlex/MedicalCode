//
//  APIManager+SearchResults.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 1/1/19.
//  Copyright © 2019 Mine. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

typealias SearchData = (serviceId: String?, patientId: String?, cityId: String, regionId: String, specialityId: String, insuranceId: String, doctorName: String, page: String, sortBy: String, longitude: String, latitude: String, perpage: String)

extension APIManager {
    static func getSearchResults(searchData: SearchData, comlpetion: @escaping (_ error: String?, _ clinics: [Clinic]?, _ pagesCount: Int?) -> Void) {
        let url = URLs.searchResults
        
        let param: [String: Any?] = ["ServiceId": searchData.serviceId,
                                     "PatientId": searchData.patientId,
                                     "CityId": searchData.cityId,
                                     "RegionId": searchData.regionId,
                                     "SpecialityId": searchData.specialityId,
                                     "InsuranceId": searchData.insuranceId,
                                     "DoctorName": searchData.doctorName,
                                     "Page":searchData.page,
                                     "SortBy":searchData.sortBy,
                                     "Longitude":searchData.longitude,
                                     "Latitude":searchData.latitude,
                                     "perpage":searchData.perpage]
        
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<SearchResultResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let clinics = response.result.value?.data, let pagesCount = response.result.value?.pagesCount {
                        comlpetion(nil, clinics, pagesCount)
                    } else {
                        comlpetion("timeout connection", nil, nil)
                        print("timeout connection")
                    }
                }
        }
    }
    
    static func getClinicInfo(clinicId: Int, comlpetion: @escaping (_ error: String?, _ clinic: ClinicInfo?) -> Void) {
        let url = URLs.clinicInfo + "\(clinicId)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<ClinicInfoResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let clinic = response.result.value?.data {
                        comlpetion(nil, clinic)
                        
                    } else {
                        comlpetion("timeout connection", nil)
                        print("timeout connection")
                    }
                }
        }
    }
}

