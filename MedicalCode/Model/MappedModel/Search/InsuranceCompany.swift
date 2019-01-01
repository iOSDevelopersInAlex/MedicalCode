//
//  Data.swift
//
//  Created by ahmedbahnasy on 6/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class InsuranceCompany: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataCompanyNameAKey: String = "CompanyNameA"
	internal let kDataCompanyNameEKey: String = "CompanyNameE"
	internal let kDataIdKey: String = "Id"


    // MARK: Properties
	public var companyNameA: String?
	public var companyNameE: String?
	public var id: Int?

    
    required public init?(map: Map){

    }

    public func mapping(map: Map) {
		companyNameA <- map[kDataCompanyNameAKey]
		companyNameE <- map[kDataCompanyNameEKey]
		id <- map[kDataIdKey]

    }
}
