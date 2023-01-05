//
//  Movie.swift
//  Netflix Clone
//
//  Created by 박현준 on 2023/01/05.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/*
 
 {
adult = 0;
"backdrop_path" = "/r9PkFnRUIthgBp2JZZzD380MWZy.jpg";
"genre_ids" =             (
 16,
 12,
 35,
 10751,
 14
);
id = 315162;
"media_type" = movie;
"original_language" = en;
"original_title" = "Puss in Boots: The Last Wish";
overview = "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.";
popularity = "1397.696";
"poster_path" = "/lmf0zzR7ritjOL3qumRh3hfvOFK.jpg";
"release_date" = "2022-12-07";
title = "Puss in Boots: The Last Wish";
video = 0;
"vote_average" = "7.972";
"vote_count" = 178;
},

 
 */
