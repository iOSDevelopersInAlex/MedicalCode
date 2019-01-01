//
//  AppointmentsInfo.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class AppointmentsInfo: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kAppointmentsInfoDateKey: String = "Date"
	internal let kAppointmentsInfoTimesKey: String = "Times"


    // MARK: Properties
	public var date: String?
	public var times: [Times]?

    init(){}
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		date <- map[kAppointmentsInfoDateKey]
		times <- map[kAppointmentsInfoTimesKey]

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
