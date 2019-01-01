//
//  BaseClass.swift
//
//  Created by ahmedbahnasy on 6/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class CompaniesResponse: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseClassDataKey: String = "data"
	internal let kBaseClassStatusKey: String = "status"
	internal let kBaseClassCodeKey: String = "code"


    // MARK: Properties
	public var data: [InsuranceCompany]?
	public var status: String?
	public var code: Int?


    
    required public init?(map: Map){

    }

    public func mapping(map: Map) {
		data <- map[kBaseClassDataKey]
		status <- map[kBaseClassStatusKey]
		code <- map[kBaseClassCodeKey]

    }
}
