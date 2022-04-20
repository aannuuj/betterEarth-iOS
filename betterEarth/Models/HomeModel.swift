//
//  HomeModel.swift
//  betterEarth
//
//  Created by Hariom Palkar on 12/04/22.
//

import Foundation

struct RecentActivity: Hashable, Identifiable {
    let id = UUID()
    //    let type: String
    let imageName: String
    let productName: String
    let offsetted: Bool
    let carbonValue: String
    let addedTime: String
}


//DUMP: 
//private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]

//    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
