//
//  Config.swift
//  MedicalCode
//
//  Created by ahmedbahnasy on 12/25/18.
//  Copyright © 2018 Mine. All rights reserved.
//

import Foundation

struct URLs {
    static let main = "http://test.esptalia.com/api/"
    /// GET No Parameters
    static let services = main + "service/getNew"
    /// GET {serviceID}
    static let specalization = main + "Specalization/getNew/"
    /// GET No Parameters
    static let insuranceCompanies = main + "insurance/getNew"
    /// GET No Parameters
    static let cityRegion = main + "Location/CityRegion"
    /// POST {CityId, RegionId, SpecialityId, InsuranceId, DoctorName, Page, SortBy, Longitude, Latitude, perpage}
    static let searchResults = main + "Clinic/searchdoctorclinics"
    /// GET {clinicID}
    static let clinicInfo = main + "Clinic/"
}
