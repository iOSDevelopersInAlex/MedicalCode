//
//  APIManager+Search.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 1/1/19.
//  Copyright © 2019 Mine. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

extension APIManager {
    static func getSpecalizations(serviceId: Int, comlpetion: @escaping (_ error: String?, _ specalizations: [Specialization]?) -> Void) {
        let url = URLs.specalization + "\(serviceId)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<SpecializationResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let specalizations = response.result.value?.data {
                        comlpetion(nil, specalizations)
                    } else {
                        comlpetion("timeout connection", nil)
                        print("timeout connection")
                    }
                }
        }
    }
    
    static func getInsuranceCompanies(comlpetion: @escaping (_ error: String?, _ companies: [InsuranceCompany]?) -> Void) {
        let url = URLs.insuranceCompanies
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<CompaniesResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let companies = response.result.value?.data {
                        comlpetion(nil, companies)
                    } else {
                        comlpetion("timeout connection", nil)
                        print("timeout connection")
                    }
                }
        }
    }
    
    static func getCityRegion(comlpetion: @escaping (_ error: String?, _ companies: [CityRegion]?) -> Void) {
        let url = URLs.cityRegion
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<CityRegionResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let data = response.result.value?.data {
                        comlpetion(nil, data)
                    } else {
                        comlpetion("timeout connection", nil)
                        print("timeout connection")
                    }
                }
        }
    }
}

