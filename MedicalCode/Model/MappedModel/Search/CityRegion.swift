//
//  Data.swift
//
//  Created by ahmedbahnasy on 6/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class CityRegion: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataRegionNameKey: String = "RegionName"
	internal let kDataCityNameKey: String = "CityName"
	internal let kDataRegionNameAKey: String = "RegionNameA"
	internal let kDataCityNameAKey: String = "CityNameA"
	internal let kDataRegionIdKey: String = "RegionId"
	internal let kDataCityIdKey: String = "CityId"


    // MARK: Properties
	public var regionName: String?
	public var cityName: String?
	public var regionNameA: String?
	public var cityNameA: String?
	public var regionId: Int?
	public var cityId: Int?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		regionName <- map[kDataRegionNameKey]
		cityName <- map[kDataCityNameKey]
		regionNameA <- map[kDataRegionNameAKey]
		cityNameA <- map[kDataCityNameAKey]
		regionId <- map[kDataRegionIdKey]
		cityId <- map[kDataCityIdKey]

    }
}
