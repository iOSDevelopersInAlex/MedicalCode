//
//  ClinicServicesListEn.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicServicesListEn: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicServicesListEnClinicIdKey: String = "ClinicId"
	internal let kClinicServicesListEnServiceDetailsEKey: String = "ServiceDetailsE"
	internal let kClinicServicesListEnIdKey: String = "Id"


    // MARK: Properties
	public var clinicId: Int?
	public var serviceDetailsE: String?
	public var id: Int?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		clinicId <- map[kClinicServicesListEnClinicIdKey]
		serviceDetailsE <- map[kClinicServicesListEnServiceDetailsEKey]
		id <- map[kClinicServicesListEnIdKey]

    }

}
