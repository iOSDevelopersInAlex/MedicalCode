//
//  AppDelegate+Extension.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/16/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
