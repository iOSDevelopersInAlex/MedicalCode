//
//  Data.swift
//
//  Created by ahmedbahnasy on 12/25/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Service: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataServiceNameAKey: String = "ServiceNameA"
	internal let kDataIsActiveKey: String = "IsActive"
	internal let kDataIdKey: String = "Id"
	internal let kDataServiceNameEKey: String = "ServiceNameE"


    // MARK: Properties
	public var serviceNameA: String?
	public var isActive: Bool = false
	public var id: Int?
	public var serviceNameE: String?

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		serviceNameA <- map[kDataServiceNameAKey]
		isActive <- map[kDataIsActiveKey]
		id <- map[kDataIdKey]
		serviceNameE <- map[kDataServiceNameEKey]

    }
}
