//
//  APIManager.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/25/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class APIManager: NSObject {
    
    static let header = ["Content-Type": "application/json",
                         "Authorization": "Basic ZXNwdGFsaWFDbGllbnQ6ZXNwI3RhbEAyNSFh",
                         ]
    
    static func getServices(comlpetion: @escaping (_ error: String?, _ servicesArr: [Service]?) -> Void) {
        let url = URLs.services
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).validate()
            .responseObject { (response: DataResponse<ServiceResponse>) in
                switch response.result {
                case .failure(let error):
                    comlpetion(error.localizedDescription, nil)
                    print(error.localizedDescription)
                case .success(_):
                    if let servicesArr = response.result.value?.data {
                        comlpetion(nil, servicesArr)
                    } else {
                        comlpetion("timeout connection", nil)
                        print("timeout connection")
                    }
                }
        }
    }
}

