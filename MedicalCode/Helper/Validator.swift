//
//  Validator.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 1/1/19.
//  Copyright © 2019 Mine. All rights reserved.
//

import UIKit

class Validator: NSObject {
   static func isOneFieldSelected(speciality: String?, city: String?, region: String?, company: String?) -> Bool {
        guard !(speciality?.isEmpty)! || !(city?.isEmpty)! || !(region?.isEmpty)! || !(company?.isEmpty)! else {
            return false
        }
        return true
    }
    
    static func getDoctorName(doctorName: String?) -> String {
        if let doctorName = doctorName, !doctorName.isEmpty, doctorName != "اسم الدكتور" {
            return doctorName
        }
        return "0"
    }
}
