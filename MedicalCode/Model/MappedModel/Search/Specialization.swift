//
//  Data.swift
//
//  Created by ahmedbahnasy on 6/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Specialization: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataNameAKey: String = "NameA"
	internal let kDataIsActiveKey: String = "IsActive"
	internal let kDataRankKey: String = "Rank"
	internal let kDataServiceIdKey: String = "ServiceId"
	internal let kDataNameEKey: String = "NameE"
	internal let kDataIdKey: String = "Id"


    // MARK: Properties
	public var nameA: String?
	public var isActive: Bool = false
	public var rank: Int?
	public var serviceId: Int?
	public var nameE: String?
	public var id: Int?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		nameA <- map[kDataNameAKey]
		isActive <- map[kDataIsActiveKey]
		rank <- map[kDataRankKey]
		serviceId <- map[kDataServiceIdKey]
		nameE <- map[kDataNameEKey]
		id <- map[kDataIdKey]

    }
}
