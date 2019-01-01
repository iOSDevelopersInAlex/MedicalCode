//
//  ClinicDateAvailableAppointmentsList.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicDateAvailableAppointmentsList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kClinicDateAvailableAppointmentsListClinicShiftsKey: String = "ClinicShifts"
	internal let kClinicDateAvailableAppointmentsListDateKey: String = "Date"


    // MARK: Properties
	public var clinicShifts: [ClinicShifts]?
	public var date: String?


    
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		clinicShifts <- map[kClinicDateAvailableAppointmentsListClinicShiftsKey]
		date <- map[kClinicDateAvailableAppointmentsListDateKey]

    }

    func getFormattedDate() -> String {
        guard let date = self.date else {return ""}
        let formattedDate = date + ".000Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: formattedDate)
        dateFormatter.locale = Locale.init(identifier: "ar")
        dateFormatter.dateFormat = "EEEE, dd MMMM YYYY"
        let requiredDate = dateFormatter.string(from: newDate!).capitalized
        return requiredDate
    }
    func getToServerFormattedDate() -> String {
        guard let date = self.date else {return ""}
        let formattedDate = date + ".000Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let newDate = dateFormatter.date(from: formattedDate)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let requiredDate = dateFormatter.string(from: newDate!).capitalized
        return requiredDate
    }
}
