//
//  BaseClass.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicInfoResponse: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseClassDataKey: String = "data"
	internal let kBaseClassStatusKey: String = "status"
	internal let kBaseClassCodeKey: String = "code"


    // MARK: Properties
	public var data: ClinicInfo?
	public var status: String?
	public var code: Int?

    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		data <- map[kBaseClassDataKey]
		status <- map[kBaseClassStatusKey]
		code <- map[kBaseClassCodeKey]

    }

}
