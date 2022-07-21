//
//  Movie.swift
//  Netflix Clone
//
//  Created by Apple on 21/07/2022.
//

import Foundation

struct Title:Codable {
    let id: Int
    let media_type:String?
    let original_language:String?
    let original_title:String?
    let overview:String?
    let popularity:Double
    let poster_path:String?
    let release_date:String?
    let title:String?
    let vote_average:Double
    let vote_count:Int
}

struct TrendingTitleResponse:Codable {
    let results: [Title]
}


//{
//adult = 0;
//"backdrop_path" = "/9eAn20y26wtB3aet7w9lHjuSgZ3.jpg";
//"genre_ids" =             (
//12,
//28,
//878
//);
//id = 507086;
//"media_type" = movie;
//"original_language" = en;
//"original_title" = "Jurassic World Dominion";
//overview = "Four years after Isla Nublar was destroyed, dinosaurs now live\U2014and hunt\U2014alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history\U2019s most fearsome creatures.";
//popularity = "12919.366";
//"poster_path" = "/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg";
//"release_date" = "2022-06-01";
//title = "Jurassic World Dominion";
//video = 0;
//"vote_average" = "7.019";
//"vote_count" = 1753;
//},
