//
//  ClinicInsuranceCompaniesList.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicInsuranceCompaniesList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicInsuranceCompaniesListCompanyNameAKey: String = "CompanyNameA"
	internal let kClinicInsuranceCompaniesListCompanyNameEKey: String = "CompanyNameE"
	internal let kClinicInsuranceCompaniesListIdKey: String = "Id"


    // MARK: Properties
	public var companyNameA: String?
	public var companyNameE: String?
	public var id: Int?

    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		companyNameA <- map[kClinicInsuranceCompaniesListCompanyNameAKey]
		companyNameE <- map[kClinicInsuranceCompaniesListCompanyNameEKey]
		id <- map[kClinicInsuranceCompaniesListIdKey]

    }

}
