//
//  AppModule.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Foundation
import Resolver

extension Resolver : @retroactive ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        registerSingletons()
        registerRemote()
        registerRepository()
        registerDomain()
    }
    
    private static func registerSingletons() {
        register { RestClientImpl() as RestClient }.scope(.application)
        register { CoreDataManager() }.scope(.application)
    }
    
    private static func registerRemote() {
        register { ApiRepoImpl() as ApiRepo }
        register { SmsRepoApiImpl() as SmsApiRepo }
        register { PaymentApiRepoImpl() as PaymentApiRepo }
        register { NagadApiRepoImpl() as NagadApiRepo }
    }
    
    private static func registerRepository() {
        
    }
    
    private static func registerDomain() {
        register { AddPlayCountScholarUseCase() }
        register { AddPlayCountUseCase() }
        register { BanglalinkPinVerifyUseCase() }
        register { BkashCancelUseCase() }
        register { CancelBanglalinkUseCase() }
        register { CancelFavoriteUseCase() }
        register { CancelPlanUseCase() }
        register { CheckIsFavoriteUseCase() }
        register { GetAlbumByIdUseCase() }
        register { GetAlbumByTypeUseCase() }
        register { GetAlbumTrackUseCase() }
        register { GetAllahNamesUseCase() }
        register { GetAllParaUseCase() }
        register { GetAlQuranUseCase() }
        register { GetArtistById() }
        register { GetArtistUseCase() }
        register { GetBkashTokenUseCase() }
        register { GetCategoriesUseCase() }
        register { GetCategoryContentsUseCase() }
        register { GetCommunityUseCase() }
        register { GetContentsUseCase() }
        register { GetHomeAllahNameUseCase() }
        register { GetHomeSurahUseCase() }
        register { GetImageContentsBySubCategoryUseCase() }
        register { GetImageContentsUseCase() }
        register { GetIslamicNameByGenderUseCase() }
        register { GetMyCommunityUseCase() }
        register { GetMyFavoriteUseCase() }
        register { GetParaUseCase() }
        register { GetPrayerTimesByCityUseCase() }
        register { GetPrayerTimesMonthlyUseCase() }
        register { GetPrayerTimesUseCase() }
        register { GetProfileUseCase() }
        register { GetPromotionsUseCase() }
        register { GetRamadanPrayerTimesUseCase() }
        register { GetScholarTrackByArtistUseCase() }
        register { GetScholarTrackByIdUseCase() }
        register { GetScholarTrackByTypeUseCase() }
        register { GetScholarUseCase() }
        register { GetScholarByIdUseCase() }
        register { GetSingleVideoUseCase() }
        register { GetSubCategoriesUseCase() }
        register { GetSubCategoryContentsUseCase() }
        register { GetSubscriptionUseCase() }
        register { GetSurahUseCase() }
        register { GetTextContentUseCase() }
        register { GetTrackBillboardUseCase() }
        register { GetTrackByIdUseCase() }
        register { GetTracksByArtistUseCase() }
        register { GetTracksByTypeUseCase() }
        register { GetVideoContentsUseCase() }
        register { GetVideoTrackUseCase() }
        register { InitiateAmarPayUseCase() }
        register { InitiateBanglalinkPaymentUseCase() }
        register { InitiateBkashPaymentUseCase() }
        register { InitiateGPPaymentUseCase() }
        register { InitiateNagadPaymentUseCase() }
        register { InitiateRobiPaymentUseCase() }
        register { InitiateSSLPaymentUseCase() }
        register { LoginUseCase() }
        register { RequestOtpUseCase() }
        register { ResetPasswordUseCase() }
        register { RobiPinVerifiyUseCase() }
        register { SendQuestionUseCase() }
        register { SetFavoriteUseCase() }
        register { SignUpUseCase() }
        register { SMSRegistrationUseCase() }
        register { UpdateProfileUseCase() }
    }
}
