//
//  UIImageView+Rounded.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/23/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setRounded(border: Bool) {
        if border{
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.mainColor.cgColor
        } else {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.white.cgColor
        }
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
