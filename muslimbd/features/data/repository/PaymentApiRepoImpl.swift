//
//  PaymentApiRepoImpl.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine
import Resolver

class PaymentApiRepoImpl: PaymentApiRepo {
    @Injected private var client: RestClient
    
    func initiateSSL(ssl: SSL) -> AnyPublisher<SSLResponseDto, any Error> {
        client.post(APIEndpoint.initiateSSL, using: ssl)
    }
    
    func getSubStatus(body: SubStatus) -> AnyPublisher<SubstatusDto, any Error> {
        client.post(APIEndpoint.subStatus, using: body)
    }
    
    func cancelPlan(body: SSL) -> AnyPublisher<CancelDto, any Error> {
        client.post(APIEndpoint.cancelPlan, using: body)
    }
    
    func bkashCancelPlan(body: BkashCancel) -> AnyPublisher<CancelDto, any Error> {
        client.post(APIEndpoint.bkashCancelPlan, using: body)
    }
    
    func initiateAmarPay(body: AmarPay) -> AnyPublisher<AmarPayResponseDto, any Error> {
        client.post(APIEndpoint.initiateAmarPay, using: body)
    }
    
    func getBKashToken(body: BkashToken) -> AnyPublisher<BkashTokenResponseDto, any Error> {
        client.post(APIEndpoint.bkashToken, using: body)
    }
    
    func initiateBkash(body: BKash, token: String) -> AnyPublisher<BKashResponseDto, any Error> {
        client.post(APIEndpoint.initiateBkash, using: body)
    }
    
    func initiateBanglalink(body: Banglalink) -> AnyPublisher<TelcoResponseDto, any Error> {
        client.post(APIEndpoint.initiateBanglalink, using: body)
    }
    
    func cancelBanglalink(body: Banglalink) -> AnyPublisher<TelcoResponseDto, any Error> {
        client.post(APIEndpoint.cancelBanglalink, using: body)
    }
    
    func initiateRobi(body: Robi) -> AnyPublisher<TelcoResponseDto, any Error> {
        client.post(APIEndpoint.initiateRobi, using: body)
    }
    
    func robiPinVerify(body: PinVerify) -> AnyPublisher<TelcoResponseDto, any Error> {
        client.post(APIEndpoint.robiPinVerify, using: body)
    }
    
    func banglalinkPinVerify(body: PinVerify) -> AnyPublisher<TelcoResponseDto, any Error> {
        client.post(APIEndpoint.banglalinkPinVerify, using: body)
    }
    
    func initateGp(body: GP) -> AnyPublisher<GPDto, any Error> {
        client.post(APIEndpoint.initiateGP, using: body)
    }
    
    func gpUnsubscribe(body: GP) -> AnyPublisher<GPDto, any Error> {
        client.post(APIEndpoint.gpUnSubscribe, using: body)
    }
    
    
}
