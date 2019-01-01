//
//  SubspecialityList.swift
//
//  Created by ahmedbahnasy on 6/29/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class SubSpecialityList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSubspecialityListDoctorIdKey: String = "DoctorId"
	internal let kSubspecialityListSubspecialityNameAKey: String = "SubspecialityNameA"
	internal let kSubspecialityListSpecializationIdKey: String = "SpecializationId"
	internal let kSubspecialityListSubspecialityNameEKey: String = "SubspecialityNameE"
	internal let kSubspecialityListIdKey: String = "Id"


    // MARK: Properties
	public var doctorId: Int?
	public var subspecialityNameA: String?
	public var specializationId: Int?
	public var subspecialityNameE: String?
	public var id: Int?


    required public init?(map: Map){

    }

    public func mapping(map: Map) {
		doctorId <- map[kSubspecialityListDoctorIdKey]
		subspecialityNameA <- map[kSubspecialityListSubspecialityNameAKey]
		specializationId <- map[kSubspecialityListSpecializationIdKey]
		subspecialityNameE <- map[kSubspecialityListSubspecialityNameEKey]
		id <- map[kSubspecialityListIdKey]

    }

}
