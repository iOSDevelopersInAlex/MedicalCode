//
//  ClinicPhotoList.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicPhotoList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicPhotoListClinicIdKey: String = "ClinicId"
	internal let kClinicPhotoListClinicPhotoIdKey: String = "ClinicPhotoId"
	internal let kClinicPhotoListImageUrlKey: String = "ImageUrl"


    // MARK: Properties
	public var clinicId: Int?
	public var clinicPhotoId: Int?
	public var imageUrl: String?


   
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		clinicId <- map[kClinicPhotoListClinicIdKey]
		clinicPhotoId <- map[kClinicPhotoListClinicPhotoIdKey]
		imageUrl <- map[kClinicPhotoListImageUrlKey]

    }

}
