//
//  APIEndpoint.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation

private let baseURL = ""
private let smsURL = ""
private let paymentURL = ""
private let nagadURL = ""


enum APIEndpoint: Endpoint {
    var url: URL {
        return URL(string: self.path)!
    }
    
    var path: String {
        switch self {
        case .categories: return "\(baseURL)Category/bn/1/0/undefined"
        case .published: return "\(baseURL)Publish/publishedcontent/bn"
        case .alQuran: return "\(baseURL)Surah/bn/1/0/undefined"
        case .categoryContents(let id): return "\(baseURL)TextContent/bycategory/\(id)/undefined/1/0"
        case .subCategoryContents(let id): return "\(baseURL)TextContent/bysubcategory/\(id)/1/0"
        case .subCategoryImageContents(let id): return "\(baseURL)ImageContent/bysubcategory/\(id)/1/0"
        case .subCategories(let id): return "\(baseURL)Subcategory/bycategory/\(id)/1/0"
        case .surah(let id): return "\(baseURL)Ayat/bysurah/\(id)/1/0"
        case .artist: return "\(baseURL)Artist/bn/1/0/undefined"
        case .scholar: return "\(baseURL)Scholar/bn/1/0/undefined"
        case .nintyNineName: return "\(baseURL)NinetyNineName/bn/1/0?searchText=undefined"
        case .tracksByType(let type, let skip, let take): return "\(baseURL)Track/bycontenttype/bn/\(type)/\(skip)/\(take)/undefined"
        case .scholarTracksByType(let type): return "\(baseURL)ScholarTrack/bycontenttype/bn/\(type)/1/0/undefined"
        case .tracksByArtist(let type, let id): return "\(baseURL)Track/byartist/bn/\(type)/\(id)/1/0/undefined"
        case .scholarTracksByArtist(let type, let id): return "\(baseURL)ScholarTrack/byartist/bn/\(type)/\(id)/1/0/undefined"
        case .albumByType(let type): return "\(baseURL)TrackAlbum/bycontenttype/bn/\(type)/1/0/undefined"
        case .albumTrack(let id): return "\(baseURL)AlbumContent/byalbum/\(id)/1/0/undefined"
        case .videoTracks: return "\(baseURL)artisttrackvideo"
        case .homeSurah: return "\(baseURL)quransuraonselect"
        case .homeAllahName: return "\(baseURL)allahnamesonselect"
        case .prayerTimes(let date, let month): return "\(baseURL)Prayer/GetPrayerTime/\(date)-\(month)"
        case .prayerTimesMonthly: return "\(baseURL)Prayer/GetPrayerTime"
        case .ramadanPayerTimes: return "\(baseURL)Prayer/GetRamadanPrayerTime"
        case .textContents(let id): return "\(baseURL)TextContent/\(id)"
        case .imageContents(let id): return "\(baseURL)ImageContent/bycategory/\(id)/undefined/1/0"
        case .signUp: return "\(baseURL)account/registration"
        case .login: return "\(baseURL)account/login"
        case .trackBilboard: return "\(baseURL)TrackBillboard/bn/1/0/undefined/mb"
        case .track(let id): return "\(baseURL)Track/\(id)"
        case .playCount: return "\(baseURL)Track/AddPlaycount"
        case .playCountScholar: return "\(baseURL)ScholarTrack/AddPlaycount"
        case .forgetPassword: return "\(baseURL)account/forgetpassword"
        case .updateProfile: return "\(baseURL)Account/updateprofile"
        case .profile: return "\(baseURL)Account/getprofile"
        case .setFavorite(let id, let artistId): return "\(baseURL)Track/Favourite/bn/\(id)/\(artistId)/mb"
        case .isFavorite(let id): return "\(baseURL)Track/isFavourite/\(id)"
        case .cancelFavorite(let id): return "\(baseURL)Track/unFavourite/\(id)"
        case .prayerTimesByCity: return "\(baseURL)Prayer/GetPrayerTimeCity"
        case .favorites: return "\(baseURL)Track/Favourite/bn/1/0"
        case .communityAll: return "\(baseURL)Community/bn/mb/1/0"
        case .communityByUser: return "\(baseURL)Community/byuser/bn/mb/1/0"
        case .sendQuestion: return "\(baseURL)Community/add"
        case .scholarById(let id): return "\(baseURL)Scholar/\(id)"
        case .artistById(let id): return "\(baseURL)Artist/\(id)"
        case .albumById(let id): return "\(baseURL)TrackAlbum/\(id)"
        case .scholarTrackById(let id): return "\(baseURL)ScholarTrack/\(id)"
        case .videoContents(let id): return "\(baseURL)VideoContent/bycategory/\(id)/undefined/1/0"
        case .singleVideo(let id): return "\(baseURL)VideoContent/\(id)"
        case .islamicNames(let gender): return "\(baseURL)IslamicName/bn/1/0/\(gender)"
        case .promotions: return "\(baseURL)Promotion/GetActiveAll/bn/mb/1/0"
        case .allPara: return "\(baseURL)Surah/getAllPara/bn"
        case .para(let id): return "\(baseURL)Surah/getSurahByPara/bn/\(id)"
            
            //sms
        case .requestOtp: return "\(smsURL)otpreq"
        case .checkOtp: return "\(smsURL)otpcheck"
        case .smsRegistration: return "\(smsURL)smsregistration"
            
            //payment
        case .initiateSSL: return "\(paymentURL)api/SSLPayInitiateDP"
        case .subStatus: return "\(paymentURL)api/subsstatusmb"
        case .cancelPlan: return "\(paymentURL)api/SSLPayCancelSubsDP"
        case .bkashCancelPlan: return "\(paymentURL)api/bkcancelsubs"
        case .initiateAmarPay: return "\(paymentURL)api/amrpayinitiate"
        case .bkashToken: return "\(paymentURL)token"
        case .initiateBkash: return "\(paymentURL)api/bkpayinitiate"
        case .initiateBanglalink: return "\(paymentURL)api/BLSendSubsUnSubsOTP"
        case .cancelBanglalink: return "\(paymentURL)api/BLSendSubsUnSubs"
        case .initiateRobi: return "\(paymentURL)api/RobiSendSubsUnSubs"
        case .robiPinVerify: return "\(paymentURL)api/RobiSendSubsUnSubsVerify"
        case .banglalinkPinVerify: return "\(paymentURL)api/BLSendSubsUnSubsVerify"
        case .initiateGP: return "\(paymentURL)api/GPSendSubs"
        case .gpUnSubscribe: return "\(paymentURL)api/GPSendUnSubs"
            
            //nagad
        case .initiateNagad: return "\(paymentURL)api/NgPayInitiate"
        }
    }
    
    case categories
    case published
    case alQuran
    case categoryContents(String)
    case subCategoryContents(String)
    case subCategoryImageContents(String)
    case subCategories(String)
    case surah(String)
    case artist
    case scholar
    case nintyNineName
    case tracksByType(String, String, String)
    case scholarTracksByType(String)
    case tracksByArtist(String, String)
    case scholarTracksByArtist(String, String)
    case albumByType(String)
    case albumTrack(String)
    case videoTracks
    case homeSurah
    case homeAllahName
    case prayerTimes(String, String)
    case prayerTimesMonthly
    case ramadanPayerTimes
    case textContents(String)
    case imageContents(String)
    case signUp
    case login
    case trackBilboard
    case track(String)
    case playCount
    case playCountScholar
    case forgetPassword
    case updateProfile
    case profile
    case setFavorite(String, String)
    case isFavorite(String)
    case cancelFavorite(String)
    case prayerTimesByCity
    case favorites
    case communityAll
    case communityByUser
    case sendQuestion
    case scholarById(String)
    case artistById(String)
    case albumById(String)
    case scholarTrackById(String)
    case videoContents(String)
    case singleVideo(String)
    case islamicNames(String)
    case promotions
    case allPara
    case para(String)
    
    //sms
    case requestOtp
    case checkOtp
    case smsRegistration
    
    //payment
    case initiateSSL
    case subStatus
    case cancelPlan
    case bkashCancelPlan
    case initiateAmarPay
    case bkashToken
    case initiateBkash
    case initiateBanglalink
    case cancelBanglalink
    case initiateRobi
    case robiPinVerify
    case banglalinkPinVerify
    case initiateGP
    case gpUnSubscribe
    
    //nagad
    case initiateNagad
}
