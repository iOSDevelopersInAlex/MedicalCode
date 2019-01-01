//
//  ClinicServicesListAr.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicServicesListAr: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicServicesListArIdKey: String = "Id"
	internal let kClinicServicesListArClinicIdKey: String = "ClinicId"
	internal let kClinicServicesListArServiceDetailsAKey: String = "ServiceDetailsA"


    // MARK: Properties
	public var id: Int?
	public var clinicId: Int?
	public var serviceDetailsA: String?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		id <- map[kClinicServicesListArIdKey]
		clinicId <- map[kClinicServicesListArClinicIdKey]
		serviceDetailsA <- map[kClinicServicesListArServiceDetailsAKey]

    }

}
