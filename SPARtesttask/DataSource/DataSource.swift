//
//  DataSource.swift
//  SPARtesttask
//
//  Created by APPLE on 13.08.2023.
//

import Foundation

final class DataSource {
    
    lazy var categories: [String: [ModelMainCell]] = ["Рекомендуем": mainList, "Сладкое настроение": sweetMoodList]
    
    public var stroiesList: [ModelStoriesCell] = [
        ModelStoriesCell(id: "1", title: "Завтраки в SPAR", image: Images.st1),
        ModelStoriesCell(id: "2", title: "Рецепты", image: Images.st2),
        ModelStoriesCell(id: "3", title: "Обед в SPAR", image: Images.st3),
        ModelStoriesCell(id: "4", title: "Мы в соцсетях", image: Images.st4),
        ModelStoriesCell(id: "5", title: "Новинки", image: Images.st5),
        ModelStoriesCell(id: "6", title: "Кофе", image: Images.st1)]
    
    public var bannersList: [ModelBannerCell] = [
        ModelBannerCell(id: "6", image: Images.promotion1),
        ModelBannerCell(id: "7", image: Images.promotion2),
        ModelBannerCell(id: "8", image: Images.promotion3),
        ModelBannerCell(id: "9", image: Images.promotion4),
        ModelBannerCell(id: "10", image: Images.promotion5)]
    
    public var offersList: [ModelOfferCell] = [
        ModelOfferCell(id: "11", image: Images.of1),
        ModelOfferCell(id: "12", image: Images.of2),
        ModelOfferCell(id: "13", image: Images.of3),
        ModelOfferCell(id: "14", image: Images.of4),
        ModelOfferCell(id: "15", image: Images.of5)]
    
    private var mainList: [ModelMainCell] = [
        ModelMainCell(id: "16", image: Images.pr1, promotion: false, currentPrice: "102,34", lastPrice: "122.48"),
        ModelMainCell(id: "17", image: Images.pr2, promotion: true, currentPrice: "45,34", lastPrice: nil),
        ModelMainCell(id: "18", image: Images.pr3, promotion: true, currentPrice: "213,12", lastPrice: nil),
        ModelMainCell(id: "19", image: Images.pr4, promotion: false, currentPrice: "100,02", lastPrice: "150.87"),
        ModelMainCell(id: "20", image: Images.pr5, promotion: false, currentPrice: "99,99", lastPrice: "134,99")]
    
    private var sweetMoodList: [ModelMainCell] = [
        ModelMainCell(id: "21", image: Images.sm1, promotion: true, currentPrice: "311,32", lastPrice: nil),
        ModelMainCell(id: "22", image: Images.sm4, promotion: false, currentPrice: "23,50", lastPrice: "45,11"),
        ModelMainCell(id: "23", image: Images.sm3, promotion: true, currentPrice: "56,85", lastPrice: nil),
        ModelMainCell(id: "24", image: Images.sm2, promotion: false, currentPrice: "119,75", lastPrice: "156,20"),
        ModelMainCell(id: "25", image: Images.sm5, promotion: false, currentPrice: "32,12", lastPrice: "66.56")]
}
