//
//  Times.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Times: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTimesStartTimeKey: String = "StartTime"
	internal let kTimesBookingStatusKey: String = "BookingStatus"
	internal let kTimesEndTimeKey: String = "EndTime"
	internal let kTimesDurationKey: String = "Duration"


    // MARK: Properties
	public var startTime: String?
	public var bookingStatus: Int?
	public var endTime: String?
	public var duration: Int?


    init(){}
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		startTime <- map[kTimesStartTimeKey]
		bookingStatus <- map[kTimesBookingStatusKey]
		endTime <- map[kTimesEndTimeKey]
		duration <- map[kTimesDurationKey]

    }

    func getFormattedStartTime(is12HFormat: Bool) -> String {
        guard let startTime = self.startTime else {return ""}
        return getFormattedTime(time: startTime, is12HFormat: is12HFormat)
    }
    func getFormattedEndTime(is12HFormat: Bool) -> String {
        guard let endTime = self.endTime else {return ""}
        return getFormattedTime(time: endTime, is12HFormat: is12HFormat)
    }
    func getFormattedTime(time: String, is12HFormat: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: time)
        dateFormatter.locale = Locale.init(identifier: "ar")
        if is12HFormat {
            dateFormatter.dateFormat = "h:mm a"
        } else {
            dateFormatter.dateFormat = "HH:mm"
        }
        return dateFormatter.string(from: date!)
    }
}
