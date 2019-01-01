//
//  Helper.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 1/1/19.
//  Copyright © 2019 Mine. All rights reserved.
//

import Foundation

class Helper: NSObject {
    
    class func getPatientID() -> Int? {
        return UserDefaults.standard.value(forKey: "patientID") as? Int
    }
    
    class func savePatientID(userID: Int?) {
        UserDefaults.standard.set(userID, forKey: "patientID")
    }
    
    class func savePatientName(patientName: String) {
        UserDefaults.standard.set(patientName, forKey: "user_name_key")
    }
    
    class func getPatientName() -> String {
        return UserDefaults.standard.string(forKey: "user_name_key") ?? "UserName"
    }
    
    class func saveUserPoints(points: String) {
        UserDefaults.standard.set(points, forKey: "user_points_key")
    }
    
    class func clearPatientID() {
        UserDefaults.standard.set(nil, forKey: "patientID")
    }
}
