//
//  HomeState.swift
//  muslimbd
//
//  Created by Al Faruk on 8/1/25.
//

import Foundation
import Combine

struct HomeState {
    internal init(isLoading: Bool = true, categories: CategoryDto = CategoryDto(), isShowMore: Bool = true, isLoaderClosed: Bool = false, prayerTimes: PrayerTimesDto = PrayerTimesDto(), cityPrayerTimes: PrayerTimeCitiesDto = PrayerTimeCitiesDto(), city: PrayerTimeCitiesDtoData = PrayerTimeCitiesDtoData(), error: String = "", currentPrayer: Prayer = Prayer(), prayerTime: [Prayer] = [], tracks: TracksDto = TracksDto(), videoTracks: TracksDto = TracksDto(), billBoard: TrackBillboardDtoItem = TrackBillboardDtoItem(), textBillBoard: TextContentDtoItem = TextContentDtoItem(), podcast: ContentDtoItem = ContentDtoItem(), scholars: ArtistDto = ArtistDto(), dailyDuas: CategoryContentsDto = CategoryContentsDto(), duas: CategoryContentsDto = CategoryContentsDto(), hadith: CategoryContentsDto = CategoryContentsDto(), zakat: CategoryContentsDto = CategoryContentsDto(), ayaat: CategoryContentsDto = CategoryContentsDto(), dorud: CategoryContentsDto = CategoryContentsDto(), kalima: TextContentDtoItem = TextContentDtoItem(), historicalPlace: TextContentDtoItem = TextContentDtoItem(), islamicEvent: TextContentDtoItem = TextContentDtoItem(), islamicBook: TextContentDtoItem = TextContentDtoItem(), nobiRasulerJiboni: TextContentDtoItem = TextContentDtoItem(), islamicDibosh: TextContentDtoItem = TextContentDtoItem(), currentBook: TextContentDtoItem = TextContentDtoItem(), amaderSahabi: TextContentDtoItem = TextContentDtoItem(), golpo: TextContentDtoItem = TextContentDtoItem(), rasulerJiboni: TextContentDtoItem = TextContentDtoItem(), hazz: CategoryContentsDto = CategoryContentsDto(), imageContents: ImageContentsDto = ImageContentsDto(), wallPapers: ImageContentsDto = ImageContentsDto(), panchaStomvo: ImageContentsDto = ImageContentsDto(), allahNames: AllahNamesDto = AllahNamesDto(), artistList: ArtistDto = ArtistDto(), playingId: String = "", mobile: String = "", subStatusDtoItem: SubStatusDtoItem = SubStatusDtoItem(), promotions: PromotionsDto = PromotionsDto(), currentTrack: TracksDtoItem = TracksDtoItem(), videoType: String = VideoType.artist.rawValue, meccaMadina: CategoryContentsDto = CategoryContentsDto(), banners: [CategoryDtoItem] = [
        CategoryDtoItem(
            name: AppConstants.islamicName,
            id: AppConstants.islamicNameId,
            icon: .islamicNames,
            image: .islamicNameBanner
        ),
        CategoryDtoItem(
            name : AppConstants.tasbeeh,
            id : AppConstants.tasbeehId,
            icon : .tasbih,
            image : .tashbiBanner
        ),
        CategoryDtoItem(
            name : AppConstants.hadith,
            isPremium : true,
            id : AppConstants.hadithId,
            icon : .hadith,
            image : .hadisBanner
        ),
        CategoryDtoItem(
            name : AppConstants.dailyDua,
            isPremium : true,
            id : AppConstants.dailyDuaId,
            icon : .dailyDua,
            image : .duaBanner
        ),
        CategoryDtoItem(
            name : AppConstants.allah99Names,
            id : AppConstants.allahNamesId,
            icon : .allah,
            image : .allahNameBanner
        ),
        CategoryDtoItem(),
        CategoryDtoItem(
            name : AppConstants.namaz,
            id : AppConstants.namazId,
            icon : .prayerLearning,
            image : .namazBanner
        ),
        CategoryDtoItem(
            name : AppConstants.ramjan,
            id : AppConstants.ramjanId,
            icon : .ramadan,
            image : .rozaBanner
        ),
        CategoryDtoItem(
            name : AppConstants.hazz,
            id : AppConstants.hajjId,
            icon : .mecca,
            image : .hajjBanner
        ),
        CategoryDtoItem(
            name : AppConstants.zakat,
            id : AppConstants.zakatId,
            icon : .zakat,
            image : .zakatBanner
        ),
        CategoryDtoItem(
            name : AppConstants.quran,
            id : AppConstants.alQuranId,
            icon : .alQuran,
            image : .quranBanner
        )
    ], tasbeeh: CategoryContentsDto = CategoryContentsDto(
        data : [
            TextContentDtoItem(
                id: "1",
                text : "Meaning : Glory be to Allah",
                textInArabic : "سُبْحَانَ اللَّه",
                title : "সুবহানাল্লাহ (Subhanallah)"
            ),
            TextContentDtoItem(
                id: "2",
                text : "Meaning : Praise be to Allah",
                textInArabic : "ٱلْحَمْدُ لِلَّٰهِ",
                title : "আলহামদুলিল্লাহ (Alhamdulillah)"
            ),
            TextContentDtoItem(
                id: "3",
                text : "Meaning : Allah is greatest",
                textInArabic : "الله أكبر",
                title : "আল্লাহু আকবার (Allahu Akbar)"
            ),
            TextContentDtoItem(
                id: "4",
                text : "Meaning : In the name of Allah",
                textInArabic : "بسم الله",
                title : "বিসমিল্লাহ (Bismillah)"
            ),
            TextContentDtoItem(
                id: "5",
                text : "Meaning : I seek forgiveness in Allah",
                textInArabic : "استغفرالله",
                title : "আস্তাগফিরুল্লাহ (Astaghfirullah)"
            ),
            TextContentDtoItem(
                id: "6",
                text : "Meaning : Allah is the Almighty",
                textInArabic : "الله",
                title : "আল্লাহ (Allah)"
            ),
            TextContentDtoItem(
                id: "7",
                text : "Meaning : There is none but Allah, truly worthy of worship except Allah",
                textInArabic : "لا اله الا الله",
                title : "লা ইলাহা ইল্লাল্লাহ (La ilaha illallah)"
            ),
            TextContentDtoItem(
                id: "8",
                text : "Meaning : There is no power and no strength except with Allah",
                textInArabic : "لا حولة ولا كواتا إلا بالله",
                title : "লা হাওলা ওয়ালা কুয়াতা ইল্লা বিল্লাহ (La hawla wala quwwata illa billah)"
            )
        ]
    )) {
        self.isLoading = isLoading
        self.categories = categories
        self.isShowMore = isShowMore
        self.isLoaderClosed = isLoaderClosed
        self.prayerTimes = prayerTimes
        self.cityPrayerTimes = cityPrayerTimes
        self.city = city
        self.error = error
        self.currentPrayer = currentPrayer
        self.prayerTime = prayerTime
        self.tracks = tracks
        self.videoTracks = videoTracks
        self.billBoard = billBoard
        self.textBillBoard = textBillBoard
        self.podcast = podcast
        self.scholars = scholars
        self.dailyDuas = dailyDuas
        self.duas = duas
        self.hadith = hadith
        self.zakat = zakat
        self.ayaat = ayaat
        self.dorud = dorud
        self.kalima = kalima
        self.historicalPlace = historicalPlace
        self.islamicEvent = islamicEvent
        self.islamicBook = islamicBook
        self.nobiRasulerJiboni = nobiRasulerJiboni
        self.islamicDibosh = islamicDibosh
        self.currentBook = currentBook
        self.amaderSahabi = amaderSahabi
        self.golpo = golpo
        self.rasulerJiboni = rasulerJiboni
        self.hazz = hazz
        self.imageContents = imageContents
        self.wallPapers = wallPapers
        self.panchaStomvo = panchaStomvo
        self.allahNames = allahNames
        self.artistList = artistList
        self.playingId = playingId
        self.mobile = mobile
        self.subStatusDtoItem = subStatusDtoItem
        self.promotions = promotions
        self.currentTrack = currentTrack
        self.videoType = videoType
        self.meccaMadina = meccaMadina
        self.banners = banners
        self.tasbeeh = tasbeeh
    }
    
    let isLoading: Bool
    let categories: CategoryDto
    let isShowMore: Bool
    let isLoaderClosed: Bool
    let prayerTimes: PrayerTimesDto
    let cityPrayerTimes: PrayerTimeCitiesDto
    let city: PrayerTimeCitiesDtoData
    let error: String
    let currentPrayer: Prayer
    let prayerTime: [Prayer]
    let tracks: TracksDto
    let videoTracks: TracksDto
    let billBoard: TrackBillboardDtoItem
    let textBillBoard: TextContentDtoItem
    let podcast: ContentDtoItem
    let scholars: ArtistDto
    let dailyDuas: CategoryContentsDto
    let duas: CategoryContentsDto
    let hadith: CategoryContentsDto
    let zakat: CategoryContentsDto
    let ayaat: CategoryContentsDto
    let dorud: CategoryContentsDto
    let kalima: TextContentDtoItem
    let historicalPlace: TextContentDtoItem
    let islamicEvent: TextContentDtoItem
    let islamicBook: TextContentDtoItem
    let nobiRasulerJiboni: TextContentDtoItem
    let islamicDibosh: TextContentDtoItem
    let currentBook: TextContentDtoItem
    let amaderSahabi: TextContentDtoItem
    let golpo: TextContentDtoItem
    let rasulerJiboni: TextContentDtoItem
    let hazz: CategoryContentsDto
    let imageContents: ImageContentsDto
    let wallPapers: ImageContentsDto
    let panchaStomvo: ImageContentsDto
    let allahNames: AllahNamesDto
    let artistList: ArtistDto
    let playingId: String
    let mobile: String
    let subStatusDtoItem: SubStatusDtoItem
    let promotions: PromotionsDto
    let currentTrack: TracksDtoItem
    let videoType: String
    let meccaMadina: CategoryContentsDto
    let banners: [CategoryDtoItem]
    let tasbeeh: CategoryContentsDto
}

extension HomeState {
    func copy(
        isLoading: Bool? = nil,
        categories: CategoryDto? = nil,
        isShowMore: Bool? = nil,
        isLoaderClosed: Bool? = nil,
        prayerTimes: PrayerTimesDto? = nil,
        cityPrayerTimes: PrayerTimeCitiesDto? = nil,
        city: PrayerTimeCitiesDtoData? = nil,
        error: String? = nil,
        currentPrayer: Prayer? = nil,
        prayerTime: [Prayer]? = nil,
        tracks: TracksDto? = nil,
        videoTracks: TracksDto? = nil,
        billBoard: TrackBillboardDtoItem? = nil,
        textBillBoard: TextContentDtoItem? = nil,
        podcast: ContentDtoItem? = nil,
        scholars: ArtistDto? = nil,
        dailyDuas: CategoryContentsDto? = nil,
        duas: CategoryContentsDto? = nil,
        hadith: CategoryContentsDto? = nil,
        zakat: CategoryContentsDto? = nil,
        ayaat: CategoryContentsDto? = nil,
        dorud: CategoryContentsDto? = nil,
        kalima: TextContentDtoItem? = nil,
        historicalPlace: TextContentDtoItem? = nil,
        islamicEvent: TextContentDtoItem? = nil,
        islamicBook: TextContentDtoItem? = nil,
        nobiRasulerJiboni: TextContentDtoItem? = nil,
        currentBook: TextContentDtoItem? = nil,
        amaderSahabi: TextContentDtoItem? = nil,
        golpo: TextContentDtoItem? = nil,
        rasulerJiboni: TextContentDtoItem? = nil,
        islamicDibosh: TextContentDtoItem? = nil,
        hazz: CategoryContentsDto? = nil,
        imageContents: ImageContentsDto? = nil,
        wallPapers: ImageContentsDto? = nil,
        panchaStomvo: ImageContentsDto? = nil,
        allahNames: AllahNamesDto? = nil,
        artistList: ArtistDto? = nil,
        playingId: String? = nil,
        mobile: String? = nil,
        subStatusDtoItem: SubStatusDtoItem? = nil,
        promotions: PromotionsDto? = nil,
        currentTrack: TracksDtoItem? = nil,
        videoType: String? = nil,
        meccaMadina: CategoryContentsDto? = nil,
        banners: [CategoryDtoItem]? = nil,
        tasbeeh: CategoryContentsDto? = nil
    ) -> HomeState {
        return HomeState(
            isLoading: isLoading ?? self.isLoading,
            categories: categories ?? self.categories,
            isShowMore: isShowMore ?? self.isShowMore,
            isLoaderClosed: isLoaderClosed ?? self.isLoaderClosed,
            prayerTimes: prayerTimes ?? self.prayerTimes,
            cityPrayerTimes: cityPrayerTimes ?? self.cityPrayerTimes,
            city: city ?? self.city,
            error: error ?? self.error,
            currentPrayer: currentPrayer ?? self.currentPrayer,
            prayerTime: prayerTime ?? self.prayerTime,
            tracks: tracks ?? self.tracks,
            videoTracks: videoTracks ?? self.videoTracks,
            billBoard: billBoard ?? self.billBoard,
            textBillBoard: textBillBoard ?? self.textBillBoard,
            podcast: podcast ?? self.podcast,
            scholars: scholars ?? self.scholars,
            dailyDuas: dailyDuas ?? self.dailyDuas,
            duas: duas ?? self.duas,
            hadith: hadith ?? self.hadith,
            zakat: zakat ?? self.zakat,
            ayaat: ayaat ?? self.ayaat,
            dorud: dorud ?? self.dorud,
            kalima: kalima ?? self.kalima,
            historicalPlace: historicalPlace ?? self.historicalPlace,
            islamicEvent: islamicEvent ?? self.islamicEvent,
            islamicBook: islamicBook ?? self.islamicBook,
            nobiRasulerJiboni: nobiRasulerJiboni ?? self.nobiRasulerJiboni,
            islamicDibosh: islamicDibosh ?? self.islamicDibosh,
            currentBook: currentBook ?? self.currentBook,
            amaderSahabi: amaderSahabi ?? self.amaderSahabi,
            golpo: golpo ?? self.golpo,
            rasulerJiboni: rasulerJiboni ?? self.rasulerJiboni,
            hazz: hazz ?? self.hazz,
            imageContents: imageContents ?? self.imageContents,
            wallPapers: wallPapers ?? self.wallPapers,
            panchaStomvo: panchaStomvo ?? self.panchaStomvo,
            allahNames: allahNames ?? self.allahNames,
            artistList: artistList ?? self.artistList,
            playingId: playingId ?? self.playingId,
            mobile: mobile ?? self.mobile,
            subStatusDtoItem: subStatusDtoItem ?? self.subStatusDtoItem,
            promotions: promotions ?? self.promotions,
            currentTrack: currentTrack ?? self.currentTrack,
            videoType: videoType ?? self.videoType,
            meccaMadina: meccaMadina ?? self.meccaMadina,
            banners: banners ?? self.banners,
            tasbeeh: tasbeeh ?? self.tasbeeh
        )
    }
}

