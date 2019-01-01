//
//  Data.swift
//
//  Created by ahmedbahnasy on 7/21/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ClinicInfo: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataNoOfBookingsPerDayKey: String = "NoOfBookingsPerDay"
	internal let kDataDiscountEndDateKey: String = "DiscountEndDate"
	internal let kDataDoctorTitleEKey: String = "DoctorTitleE"
	internal let kDataDoctorImageUrlKey: String = "DoctorImageUrl"
	internal let kDataLongitudeKey: String = "Longitude"
	internal let kDataFeaturedKey: String = "Featured"
	internal let kDataDoctorDescriptionAKey: String = "DoctorDescriptionA"
	internal let kDataSubspecialityListKey: String = "SubspecialityList"
	internal let kDataClinicNameEKey: String = "ClinicNameE"
	internal let kDataClinicDateAvailableAppointmentsListKey: String = "ClinicDateAvailableAppointmentsList"
	internal let kDataDiscountStartDateKey: String = "DiscountStartDate"
	internal let kDataReviewListKey: String = "ReviewList"
	internal let kDataBookingTypeIdKey: String = "BookingTypeId"
	internal let kDataFeesKey: String = "Fees"
	internal let kDataAcademicDegreeIdKey: String = "AcademicDegreeId"
	internal let kDataClinicInsuranceCompaniesListKey: String = "ClinicInsuranceCompaniesList"
	internal let kDataClinicIdKey: String = "ClinicId"
	internal let kDataClinicServicesListEnKey: String = "ClinicServicesListEn"
	internal let kDataSpecializationNameAKey: String = "SpecializationNameA"
	internal let kDataClinicPhotoListKey: String = "ClinicPhotoList"
	internal let kDataCurrencyKey: String = "Currency"
	internal let kDataSpecializationNameEKey: String = "SpecializationNameE"
	internal let kDataReviewScoreKey: String = "ReviewScore"
	internal let kDataLatitudeKey: String = "Latitude"
	internal let kDataSpecializationIdKey: String = "SpecializationId"
	internal let kDataCityIdKey: String = "CityId"
	internal let kDataFeesAfterDiscountKey: String = "FeesAfterDiscount"
	internal let kDataDoctorDescriptionEKey: String = "DoctorDescriptionE"
	internal let kDataClinicNameAKey: String = "ClinicNameA"
	internal let kDataClinicServicesListArKey: String = "ClinicServicesListAr"
	internal let kDataAddressAKey: String = "AddressA"
	internal let kDataDoctorFullNameEKey: String = "DoctorFullNameE"
	internal let kDataNoOfReviewsKey: String = "NoOfReviews"
	internal let kDataWaitingTimeKey: String = "WaitingTime"
	internal let kDataServiceProviderTypeIdKey: String = "ServiceProviderTypeId"
	internal let kDataAddressEKey: String = "AddressE"
	internal let kDataDocotrTitleAKey: String = "DocotrTitleA"
	internal let kDataGenderKey: String = "Gender"
	internal let kDataRegionIdKey: String = "RegionId"
	internal let kDataAppointmentsListKey: String = "AppointmentsList"
	internal let kDataDoctorIdKey: String = "DoctorId"
	internal let kDataAppointmentsInfoKey: String = "AppointmentsInfo"
	internal let kDataRankKey: String = "Rank"
	internal let kDataCurrencyAKey: String = "CurrencyA"
	internal let kDataNoOfViewsKey: String = "NoOfViews"
	internal let kDataDoctorFullNameAKey: String = "DoctorFullNameA"


    // MARK: Properties
	public var noOfBookingsPerDay: Int?
	public var discountEndDate: String?
	public var doctorTitleE: String?
	public var doctorImageUrl: String?
	public var longitude: Float?
	public var featured: Bool = false
	public var doctorDescriptionA: String?
	public var subspecialityList: [SubSpecialityList]?
	public var clinicNameE: String?
	public var clinicDateAvailableAppointmentsList: [ClinicDateAvailableAppointmentsList]?
	public var discountStartDate: String?
	public var reviewList: [ReviewList]?
	public var bookingTypeId: Int?
	public var fees: Int?
	public var academicDegreeId: Int?
	public var clinicInsuranceCompaniesList: [ClinicInsuranceCompaniesList]?
	public var clinicId: Int?
	public var clinicServicesListEn: [ClinicServicesListEn]?
	public var specializationNameA: String?
	public var clinicPhotoList: [ClinicPhotoList]?
	public var currency: String?
	public var specializationNameE: String?
	public var reviewScore: Int?
	public var latitude: Float?
	public var specializationId: Int?
	public var cityId: Int?
	public var feesAfterDiscount: Int?
	public var doctorDescriptionE: String?
	public var clinicNameA: String?
	public var clinicServicesListAr: [ClinicServicesListAr]?
	public var addressA: String?
	public var doctorFullNameE: String?
	public var noOfReviews: Int?
	public var waitingTime: Int?
	public var serviceProviderTypeId: Int?
	public var addressE: String?
	public var docotrTitleA: String?
	public var gender: Int?
	public var regionId: Int?
	public var appointmentsList: [Appointment]?
	public var doctorId: Int?
	public var appointmentsInfo: [AppointmentsInfo]?
	public var rank: Bool = false
	public var currencyA: String?
	public var noOfViews: Int?
	public var doctorFullNameA: String?


    init(){}
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		noOfBookingsPerDay <- map[kDataNoOfBookingsPerDayKey]
		discountEndDate <- map[kDataDiscountEndDateKey]
		doctorTitleE <- map[kDataDoctorTitleEKey]
		doctorImageUrl <- map[kDataDoctorImageUrlKey]
		longitude <- map[kDataLongitudeKey]
		featured <- map[kDataFeaturedKey]
		doctorDescriptionA <- map[kDataDoctorDescriptionAKey]
		subspecialityList <- map[kDataSubspecialityListKey]
		clinicNameE <- map[kDataClinicNameEKey]
		clinicDateAvailableAppointmentsList <- map[kDataClinicDateAvailableAppointmentsListKey]
		discountStartDate <- map[kDataDiscountStartDateKey]
		reviewList <- map[kDataReviewListKey]
		bookingTypeId <- map[kDataBookingTypeIdKey]
		fees <- map[kDataFeesKey]
		academicDegreeId <- map[kDataAcademicDegreeIdKey]
		clinicInsuranceCompaniesList <- map[kDataClinicInsuranceCompaniesListKey]
		clinicId <- map[kDataClinicIdKey]
		clinicServicesListEn <- map[kDataClinicServicesListEnKey]
		specializationNameA <- map[kDataSpecializationNameAKey]
		clinicPhotoList <- map[kDataClinicPhotoListKey]
		currency <- map[kDataCurrencyKey]
		specializationNameE <- map[kDataSpecializationNameEKey]
		reviewScore <- map[kDataReviewScoreKey]
		latitude <- map[kDataLatitudeKey]
		specializationId <- map[kDataSpecializationIdKey]
		cityId <- map[kDataCityIdKey]
		feesAfterDiscount <- map[kDataFeesAfterDiscountKey]
		doctorDescriptionE <- map[kDataDoctorDescriptionEKey]
		clinicNameA <- map[kDataClinicNameAKey]
		clinicServicesListAr <- map[kDataClinicServicesListArKey]
		addressA <- map[kDataAddressAKey]
		doctorFullNameE <- map[kDataDoctorFullNameEKey]
		noOfReviews <- map[kDataNoOfReviewsKey]
		waitingTime <- map[kDataWaitingTimeKey]
		serviceProviderTypeId <- map[kDataServiceProviderTypeIdKey]
		addressE <- map[kDataAddressEKey]
		docotrTitleA <- map[kDataDocotrTitleAKey]
		gender <- map[kDataGenderKey]
		regionId <- map[kDataRegionIdKey]
		appointmentsList <- map[kDataAppointmentsListKey]
		doctorId <- map[kDataDoctorIdKey]
		appointmentsInfo <- map[kDataAppointmentsInfoKey]
		rank <- map[kDataRankKey]
		currencyA <- map[kDataCurrencyAKey]
		noOfViews <- map[kDataNoOfViewsKey]
		doctorFullNameA <- map[kDataDoctorFullNameAKey]

    }
    
//    func getDoctorName() -> String {
//        let stringA = "Doctor".localized + " " + (self.doctorFullNameA ?? "")
//        let stringE = "Doctor".localized + " " + (self.doctorFullNameE ?? "")
//        return LanguageManager.sharedInstance.isRTL() ? stringA : stringE
//    }
//    func getDoctorImageURL() -> String {
//        var url = self.doctorImageUrl?.replacingOccurrences(of: "~", with: URLs.main_img)
//        url = url?.replacingOccurrences(of: " ", with: "%20")
//        return url ?? ""
//    }
//    func getNumOfReviews() -> String {
//        let stringA = "\(self.noOfReviews ?? 0)".replaceEnglishDigitsWithArabic + " " + "Review".localized
//        let stringE = "\(self.noOfReviews ?? 0)".replacedArabicDigitsWithEnglish + " " + "Review".localized
//        return LanguageManager.sharedInstance.isRTL() ? stringA : stringE
//    }
//    func getDoctorTitle() -> String {
//        return LanguageManager.sharedInstance.isRTL() ? self.docotrTitleA ?? "" : self.doctorTitleE ?? ""
//    }
//    func getDoctorDescription() -> String {
//        return LanguageManager.sharedInstance.isRTL() ? self.doctorDescriptionA ?? "" : self.doctorDescriptionE ?? ""
//    }
//    func getSubSpecialityList() -> String {
//        guard let list = self.subspecialityList else {return ""}
//        var specialityList: [String] = []
//        for item in list {
//            if LanguageManager.sharedInstance.isRTL() {
//                if let speciality = item.subspecialityNameA {
//                    specialityList.append(speciality)
//                }
//            } else {
//                if let speciality = item.subspecialityNameE {
//                    specialityList.append(speciality)
//                }
//            }
//        }
//        let specialities = specialityList.joined(separator: " - ")
//        return specialities
//    }
//    func getAddress() -> String {
//        return LanguageManager.sharedInstance.isRTL() ? self.addressA ?? "" : self.addressE ?? ""
//    }
//    func getWaitingTime() -> String {
//        let stringA = "WaitingTime".localized + "\(self.waitingTime ?? 0)".replaceEnglishDigitsWithArabic + " " + "minute".localized
//        let stringE = "WaitingTime".localized + "\(self.waitingTime ?? 0)".replacedArabicDigitsWithEnglish + " " + "minute".localized
//        return LanguageManager.sharedInstance.isRTL() ? stringA : stringE
//    }
//    func getExaminationFees() -> String {
//        let stringA = "ExaminationFees".localized + "\(self.fees ?? 0)".replaceEnglishDigitsWithArabic + " " + (self.currencyA ?? "")
//        let stringE = "ExaminationFees".localized + "\(self.fees ?? 0)".replacedArabicDigitsWithEnglish + " " + (self.currency ?? "")
//        return LanguageManager.sharedInstance.isRTL() ? stringA : stringE
//    }
//    
//    func getInsuranceComapaniesList() -> String {
//        guard let list = self.clinicInsuranceCompaniesList else {return ""}
//        var comapaniesList: [String] = []
//        for item in list {
//            if LanguageManager.sharedInstance.isRTL() {
//                if let speciality = item.companyNameA {
//                    comapaniesList.append(speciality)
//                }
//            } else {
//                if let speciality = item.companyNameE {
//                    comapaniesList.append(speciality)
//                }
//            }
//        }
//        let companies = comapaniesList.joined(separator: " - ")
//        return companies
//    }
//
//    func getClinicServicesList() -> String {
//        guard let listA = self.clinicServicesListAr, let listE = self.clinicServicesListEn else {return ""}
//        
//        var servicesList: [String] = []
//        if LanguageManager.sharedInstance.isRTL() {
//            for item in listA {
//                if let speciality = item.serviceDetailsA {
//                    servicesList.append(speciality)
//                }
//            }
//        } else {
//            for item in listE {
//                if let speciality = item.serviceDetailsE {
//                    servicesList.append(speciality)
//                }
//            }
//        }
//        let services = servicesList.joined(separator: " - ")
//        return services
//    }
//    func getDatesArr() -> [String] {
//        var dates: [String] = []
//        if let List = self.appointmentsInfo, List.count != 0 {
//            for item in List {
//                dates.append(item.getFormattedDate())
//            }
//        } else if let List = self.clinicDateAvailableAppointmentsList, List.count != 0 {
//            for item in List {
//                dates.append(item.getFormattedDate())
//            }
//        }
//        return dates
//    }
//    func getToServerDatesArr() -> [String] {
//        var dates: [String] = []
//        if let List = self.appointmentsInfo, List.count != 0 {
//            for item in List {
//                dates.append(item.getToServerFormattedDate())
//            }
//        } else if let List = self.clinicDateAvailableAppointmentsList, List.count != 0 {
//            for item in List {
//                dates.append(item.getToServerFormattedDate())
//            }
//        }
//        return dates
//    }
}
