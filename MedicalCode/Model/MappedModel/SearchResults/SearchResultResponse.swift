//
//  BaseClass.swift
//
//  Created by ahmedbahnasy on 6/29/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class SearchResultResponse: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseClassCodeKey: String = "code"
	internal let kBaseClassPagesCountKey: String = "PagesCount"
	internal let kBaseClassDataKey: String = "data"
	internal let kBaseClassStatusKey: String = "status"


    // MARK: Properties
	public var code: Int?
	public var pagesCount: Int?
	public var data: [Clinic]?
	public var status: String?


    required public init?(map: Map){

    }

    public func mapping(map: Map) {
		code <- map[kBaseClassCodeKey]
		pagesCount <- map[kBaseClassPagesCountKey]
		data <- map[kBaseClassDataKey]
		status <- map[kBaseClassStatusKey]

    }
}
