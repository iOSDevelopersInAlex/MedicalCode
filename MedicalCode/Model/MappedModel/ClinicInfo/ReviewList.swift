//
//  ReviewList.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ReviewList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kReviewListFullNameKey: String = "FullName"
	internal let kReviewListRatingKey: String = "Rating"
	internal let kReviewListReviewDateKey: String = "ReviewDate"
	internal let kReviewListCommentKey: String = "Comment"
	internal let kReviewListClinicIdKey: String = "ClinicId"
	internal let kReviewListIdKey: String = "Id"


    // MARK: Properties
	public var fullName: String?
	public var rating: Int?
	public var reviewDate: String?
	public var comment: String?
	public var clinicId: Int?
	public var id: Int?

    public init() {}

    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		fullName <- map[kReviewListFullNameKey]
		rating <- map[kReviewListRatingKey]
		reviewDate <- map[kReviewListReviewDateKey]
		comment <- map[kReviewListCommentKey]
		clinicId <- map[kReviewListClinicIdKey]
		id <- map[kReviewListIdKey]

    }

}
