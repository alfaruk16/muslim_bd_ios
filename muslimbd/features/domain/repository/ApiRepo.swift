//
//  ApiService.swift
//  muslimbd
//
//  Created by Al Faruk on 29/12/24.
//

import Combine
import Foundation

protocol ApiRepo {
    func getCategories() -> AnyPublisher<CategoryDto, Error>
    func getPublished() -> AnyPublisher<ContentsDto, Error>
    func getAlQuran() -> AnyPublisher<AlQuranDto, Error>
    func getCategoryContents(id: String) -> AnyPublisher<CategoryContentsDto, Error>
    func getSubCategoryContents(id: String) -> AnyPublisher<CategoryContentsDto, Error>
    func getSubCategoryImageContents(id: String) -> AnyPublisher<ImageContentsDto, Error>
    func getSubCategories(id: String) -> AnyPublisher<CategoryDto, Error>
    func getContents() -> AnyPublisher<ContentsDto, Error>
    func getSurah(id: String) -> AnyPublisher<SurahDto, Error>
    func getArtist() -> AnyPublisher<ArtistDto, Error>
    func getScholar() -> AnyPublisher<ArtistDto, Error>
    func getAllahNames() -> AnyPublisher<AllahNamesDto, Error>
    func getTracksByType(type: String, skip: String, take: String) -> AnyPublisher<TracksDto, Error>
    func getScholarTracksByType(type: String) -> AnyPublisher<TracksDto, Error>
    func getTracksByArtist(type: String, id: String) -> AnyPublisher<TracksDto, Error>
    func getScholarTracksByArtist(type: String, id: String) -> AnyPublisher<TracksDto, Error>
    func getAlbumByType(type: String) -> AnyPublisher<AlbumDto, Error>
    func getAlbumTrack(id: String) -> AnyPublisher<AlbumTrackDto, Error>
    func getVideoTracks() -> AnyPublisher<TracksDto, Error>
    func getHomeSurah() -> AnyPublisher<AlQuranDto, Error>
    func getHomeAllahNames() -> AnyPublisher<AllahNamesDto, Error>
    func getPrayerTimes(date: String, month: String) -> AnyPublisher<PrayerTimesDto, Error>
    func getMonthlyPrayerTimes() -> AnyPublisher<PrayerTimesDto, Error>
    func getRamadanPrayerTimes() -> AnyPublisher<PrayerTimesDto, Error>
    func getTextContent(id: String) -> AnyPublisher<TextContentDto, Error>
    func getImageContents(id: String) -> AnyPublisher<ImageContentsDto, Error>
    func signUp(body: SignUp) -> AnyPublisher<SignUpDto, Error>
    func login(body: Login) -> AnyPublisher<LoginDto, Error>
    func getTrackBillboard() -> AnyPublisher<TrackBillboardDto, Error>
    func getTrack(id: String) -> AnyPublisher<TrackDto, Error>
    func addPlayCount(body: PlayCount) -> AnyPublisher<DefaultDto, Error>
    func addPlayCountScholar(body: PlayCountScholar) -> AnyPublisher<DefaultDto, Error>
    func resetPassword(userName: String, password: String, type: String) -> AnyPublisher<DefaultDto, Error>
    func updateProfile(body: UpdateProfile) -> AnyPublisher<DefaultDto, Error>
    func getProfile() -> AnyPublisher<ProfileDto, Error>
    func setFavorite(id: String, artistId: String) -> AnyPublisher<DefaultDto, Error>
    func isFavorite(id: String) -> AnyPublisher<DefaultDto, Error>
    func cancelFavorite(id: String) -> AnyPublisher<DefaultDto, Error>
    func getPrayerTimesByCity() -> AnyPublisher<PrayerTimeCitiesDto, Error>
    func getMyFavorites() -> AnyPublisher<TracksDto, Error>
    func getCommunityAll() -> AnyPublisher<CommunityAllDto, Error>
    func getMyCommunity() -> AnyPublisher<CommunityAllDto, Error>
    func sendQuestion(body: Question) -> AnyPublisher<DefaultDto, Error>
    func getScholarById(id: String) -> AnyPublisher<ScholarDto, Error>
    func getArtistById(id: String) -> AnyPublisher<SingleArtistDto, Error>
    func getAlbumById(id: String) -> AnyPublisher<SingleAlbumDto, Error>
    func getScholarTrackById(id: String) -> AnyPublisher<ScholarTrackDto, Error>
    func getVideoContents(id: String) -> AnyPublisher<VideoContentsDto, Error>
    func getSingleVideo(id: String) -> AnyPublisher<SingleVideoDto, Error>
    func getIslamicNames(gender: String) -> AnyPublisher<IslamicNamesDto, Error>
    func getPromotions() -> AnyPublisher<PromotionsDto, Error>
    func getAllPara() -> AnyPublisher<AllParaDto, Error>
    func getPara(id: String) -> AnyPublisher<ParaDto, Error>
}
