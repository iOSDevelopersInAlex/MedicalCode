//
//  Data.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Appointment: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataLatitudeKey: String = "Latitude"
	internal let kDataDoctorImageUrlKey: String = "DoctorImageUrl"
	internal let kDataDoctorNameEKey: String = "DoctorNameE"
	internal let kDataLongitudeKey: String = "Longitude"
	internal let kDataDoctorNameAKey: String = "DoctorNameA"
	internal let kDataFeesAfterDiscountKey: String = "FeesAfterDiscount"
	internal let kDataToTimeKey: String = "ToTime"
	internal let kDataFromTimeKey: String = "FromTime"
	internal let kDataDateKey: String = "Date"
	internal let kDataIdKey: String = "Id"
	internal let kDataBookingStatusKey: String = "BookingStatus"
	internal let kDataFeesKey: String = "Fees"
	internal let kDataClinicIdKey: String = "ClinicId"
	internal let kDataPatientIdKey: String = "PatientId"
	internal let kDataReviewScoreKey: String = "ReviewScore"


    // MARK: Properties
	public var latitude: Float?
	public var doctorImageUrl: String?
	public var doctorNameE: String?
	public var longitude: Float?
	public var doctorNameA: String?
	public var feesAfterDiscount: Int?
	public var toTime: String?
	public var fromTime: String?
	public var date: String?
	public var id: Int?
	public var bookingStatus: Int?
	public var fees: Int?
	public var clinicId: Int?
	public var patientId: Int?
	public var reviewScore: Int?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		latitude <- map[kDataLatitudeKey]
		doctorImageUrl <- map[kDataDoctorImageUrlKey]
		doctorNameE <- map[kDataDoctorNameEKey]
		longitude <- map[kDataLongitudeKey]
		doctorNameA <- map[kDataDoctorNameAKey]
		feesAfterDiscount <- map[kDataFeesAfterDiscountKey]
		toTime <- map[kDataToTimeKey]
		fromTime <- map[kDataFromTimeKey]
		date <- map[kDataDateKey]
		id <- map[kDataIdKey]
		bookingStatus <- map[kDataBookingStatusKey]
		fees <- map[kDataFeesKey]
		clinicId <- map[kDataClinicIdKey]
		patientId <- map[kDataPatientIdKey]
		reviewScore <- map[kDataReviewScoreKey]

    }

}
