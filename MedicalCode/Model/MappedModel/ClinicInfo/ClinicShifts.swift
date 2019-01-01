//
//  ClinicShifts.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicShifts: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicShiftsShiftNoKey: String = "ShiftNo"
	internal let kClinicShiftsToTimeKey: String = "ToTime"
	internal let kClinicShiftsFromTimeKey: String = "FromTime"
	internal let kClinicShiftsAvailableAppointmentsCountKey: String = "AvailableAppointmentsCount"


    // MARK: Properties
	public var shiftNo: Int?
	public var toTime: String?
	public var fromTime: String?
	public var availableAppointmentsCount: Int?


    init() {}
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		shiftNo <- map[kClinicShiftsShiftNoKey]
		toTime <- map[kClinicShiftsToTimeKey]
		fromTime <- map[kClinicShiftsFromTimeKey]
		availableAppointmentsCount <- map[kClinicShiftsAvailableAppointmentsCountKey]

    }

    func getFormattedFromTime(is12HFormat: Bool) -> String {
        guard let startTime = self.fromTime else {return ""}
        return getFormattedTime(time: startTime, is12HFormat: is12HFormat)
    }
    func getFormattedToTime(is12HFormat: Bool) -> String {
        guard let endTime = self.toTime else {return ""}
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
