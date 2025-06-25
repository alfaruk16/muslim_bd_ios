//
//  ApiRepoImpl.swift
//  muslimbd
//
//  Created by Al Faruk on 2/1/25.
//

import Foundation
import Combine
import Resolver

class ApiRepoImpl: ApiRepo {
    @Injected private var client: RestClient
    
    func getCategories() -> AnyPublisher<CategoryDto, Error> {
        client.get(APIEndpoint.categories)
    }
    
    func getPublished() -> AnyPublisher<ContentsDto, Error> {
        client.get(APIEndpoint.published)
    }
    
    func getAlQuran() -> AnyPublisher<AlQuranDto, any Error> {
        client.get(APIEndpoint.alQuran)
    }
    
    func getCategoryContents(id: String) -> AnyPublisher<CategoryContentsDto, any Error> {
        client.get(APIEndpoint.categoryContents(id))
    }
    
    func getSubCategoryContents(id: String) -> AnyPublisher<CategoryContentsDto, any Error> {
        client.get(APIEndpoint.subCategoryContents(id))
    }
    
    func getSubCategoryImageContents(id: String) -> AnyPublisher<ImageContentsDto, any Error> {
        client.get(APIEndpoint.subCategoryImageContents(id))
    }
    
    func getSubCategories(id: String) -> AnyPublisher<CategoryDto, any Error> {
        client.get(APIEndpoint.subCategories(id))
    }
    
    func getContents() -> AnyPublisher<ContentsDto, any Error> {
        client.get(APIEndpoint.published)
    }
    
    func getSurah(id: String) -> AnyPublisher<SurahDto, any Error> {
        client.get(APIEndpoint.surah(id))
    }
    
    func getArtist() -> AnyPublisher<ArtistDto, any Error> {
        client.get(APIEndpoint.artist)
    }
    
    func getScholar() -> AnyPublisher<ArtistDto, any Error> {
        client.get(APIEndpoint.scholar)
    }
    
    func getAllahNames() -> AnyPublisher<AllahNamesDto, any Error> {
        client.get(APIEndpoint.nintyNineName)
    }
    
    func getTracksByType(type: String, skip: String, take: String) -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.tracksByType(type, skip, take))
    }
    
    func getScholarTracksByType(type: String) -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.scholarTracksByType(type))
    }
    
    func getTracksByArtist(type: String, id: String) -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.tracksByArtist(type, id))
    }
    
    func getScholarTracksByArtist(type: String, id: String) -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.scholarTracksByArtist(type, id))
    }
    
    func getAlbumByType(type: String) -> AnyPublisher<AlbumDto, any Error> {
        client.get(APIEndpoint.albumByType(type))
    }
    
    func getAlbumTrack(id: String) -> AnyPublisher<AlbumTrackDto, any Error> {
        client.get(APIEndpoint.albumTrack(id))
    }
    
    func getVideoTracks() -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.videoTracks)
    }
    
    func getHomeSurah() -> AnyPublisher<AlQuranDto, any Error> {
        client.get(APIEndpoint.homeSurah)
    }
    
    func getHomeAllahNames() -> AnyPublisher<AllahNamesDto, any Error> {
        client.get(APIEndpoint.homeAllahName)
    }
    
    func getPrayerTimes(date: String, month: String) -> AnyPublisher<PrayerTimesDto, any Error> {
        client.get(APIEndpoint.prayerTimes(date, month))
    }
    
    func getMonthlyPrayerTimes() -> AnyPublisher<PrayerTimesDto, any Error> {
        client.get(APIEndpoint.prayerTimesMonthly)
    }
    
    func getRamadanPrayerTimes() -> AnyPublisher<PrayerTimesDto, any Error> {
        client.get(APIEndpoint.ramadanPayerTimes)
    }
    
    func getTextContent(id: String) -> AnyPublisher<TextContentDto, any Error> {
        client.get(APIEndpoint.textContents(id))
    }
    
    func getImageContents(id: String) -> AnyPublisher<ImageContentsDto, any Error> {
        client.get(APIEndpoint.imageContents(id))
    }
    
    func signUp(body: SignUp) -> AnyPublisher<SignUpDto, Error> {
        client.post(APIEndpoint.signUp, using: body)
    }
    
    func login(body: Login) -> AnyPublisher<LoginDto, Error> {
        client.post(APIEndpoint.login, using: body)
    }
    
    func getTrackBillboard() -> AnyPublisher<TrackBillboardDto, any Error> {
        client.get(APIEndpoint.trackBilboard)
    }
    
    func getTrack(id: String) -> AnyPublisher<TrackDto, any Error> {
        client.get(APIEndpoint.track(id))
    }
    
    func addPlayCount(body: PlayCount) -> AnyPublisher<DefaultDto, any Error> {
        client.postMultipart(APIEndpoint.playCount, using: body)
    }
    
    func addPlayCountScholar(body: PlayCountScholar) -> AnyPublisher<DefaultDto, any Error> {
        client.postMultipart(APIEndpoint.playCountScholar, using: body)
    }
    
    func resetPassword(userName: String, password: String, type: String) -> AnyPublisher<DefaultDto, any Error> {
        client.postWithQuery(APIEndpoint.forgetPassword, queries: ["userName": userName, "password": password, "AppTypes": type])
    }
    
    func updateProfile(body: UpdateProfile) -> AnyPublisher<DefaultDto, any Error> {
        client.postMultipart(APIEndpoint.updateProfile, using: body)
    }
    
    func getProfile() -> AnyPublisher<ProfileDto, any Error> {
        client.get(APIEndpoint.profile)
    }
    
    func setFavorite(id: String, artistId: String) -> AnyPublisher<DefaultDto, any Error> {
        client.post(APIEndpoint.setFavorite(id, artistId), using: Empty())
    }
    
    func isFavorite(id: String) -> AnyPublisher<DefaultDto, any Error> {
        client.get(APIEndpoint.isFavorite(id))
    }
    
    func cancelFavorite(id: String) -> AnyPublisher<DefaultDto, any Error> {
        client.delete(APIEndpoint.cancelFavorite(id))
    }
    
    func getPrayerTimesByCity() -> AnyPublisher<PrayerTimeCitiesDto, any Error> {
        client.get(APIEndpoint.prayerTimesByCity)
    }
    
    func getMyFavorites() -> AnyPublisher<TracksDto, any Error> {
        client.get(APIEndpoint.favorites)
    }
    
    func getCommunityAll() -> AnyPublisher<CommunityAllDto, any Error> {
        client.get(APIEndpoint.communityAll)
    }
    
    func getMyCommunity() -> AnyPublisher<CommunityAllDto, any Error> {
        client.get(APIEndpoint.communityAll)
    }
    
    func sendQuestion(body: Question) -> AnyPublisher<DefaultDto, any Error> {
        client.postMultipart(APIEndpoint.sendQuestion, using: body)
    }
    
    func getScholarById(id: String) -> AnyPublisher<ScholarDto, any Error> {
        client.get(APIEndpoint.scholarById(id))
    }
    
    func getArtistById(id: String) -> AnyPublisher<SingleArtistDto, any Error> {
        client.get(APIEndpoint.artistById(id))
    }
    
    func getAlbumById(id: String) -> AnyPublisher<SingleAlbumDto, any Error> {
        client.get(APIEndpoint.albumById(id))
    }
    
    func getScholarTrackById(id: String) -> AnyPublisher<ScholarTrackDto, any Error> {
        client.get(APIEndpoint.scholarTrackById(id))
    }
    
    func getVideoContents(id: String) -> AnyPublisher<VideoContentsDto, any Error> {
        client.get(APIEndpoint.videoContents(id))
    }
    
    func getSingleVideo(id: String) -> AnyPublisher<SingleVideoDto, any Error> {
        client.get(APIEndpoint.singleVideo(id))
    }
    
    func getIslamicNames(gender: String) -> AnyPublisher<IslamicNamesDto, any Error> {
        client.get(APIEndpoint.islamicNames(gender))
    }
    
    func getPromotions() -> AnyPublisher<PromotionsDto, any Error> {
        client.get(APIEndpoint.promotions)
    }
    
    func getAllPara() -> AnyPublisher<AllParaDto, any Error> {
        client.get(APIEndpoint.allPara)
    }
    
    func getPara(id: String) -> AnyPublisher<ParaDto, any Error> {
        client.get(APIEndpoint.para(id))
    }
    
   
}
