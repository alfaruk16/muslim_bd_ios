//
//  SmsApiRepo.swift
//  muslimbd
//
//  Created by Al Faruk on 6/1/25.
//

import Foundation
import Combine

protocol SmsApiRepo {
    func requestOtp(otp: Otp) -> AnyPublisher<OtpDto, Error>
    func checkOtp(checkOtp: CheckOtp) -> AnyPublisher<OtpDto, Error>
    func smsRegistration(body: SMSRegistration) -> AnyPublisher<SMSRegistrationResponseDto, Error>
}
