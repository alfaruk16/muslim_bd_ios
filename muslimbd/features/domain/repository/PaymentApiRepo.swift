//
//  PaymentApiRepo.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine

protocol PaymentApiRepo {
    func initiateSSL(ssl: SSL) -> AnyPublisher<SSLResponseDto, Error>
    func getSubStatus(body: SubStatus) -> AnyPublisher<SubstatusDto, Error>
    func cancelPlan(body: SSL) -> AnyPublisher<CancelDto, Error>
    func bkashCancelPlan(body: BkashCancel) -> AnyPublisher<CancelDto, Error>
    func initiateAmarPay(body: AmarPay) -> AnyPublisher<AmarPayResponseDto, Error>
    func getBKashToken(body: BkashToken) -> AnyPublisher<BkashTokenResponseDto, Error>
    func initiateBkash(body: BKash, token: String) -> AnyPublisher<BKashResponseDto, Error>
    func initiateBanglalink(body: Banglalink) -> AnyPublisher<TelcoResponseDto, Error>
    func cancelBanglalink(body: Banglalink) -> AnyPublisher<TelcoResponseDto, Error>
    func initiateRobi(body: Robi) -> AnyPublisher<TelcoResponseDto, Error>
    func robiPinVerify(body: PinVerify) -> AnyPublisher<TelcoResponseDto, Error>
    func banglalinkPinVerify(body: PinVerify) -> AnyPublisher<TelcoResponseDto, Error>
    func initateGp(body: GP) -> AnyPublisher<GPDto, Error>
    func gpUnsubscribe(body: GP) -> AnyPublisher<GPDto, Error>
}
