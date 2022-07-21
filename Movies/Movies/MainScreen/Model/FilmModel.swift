//
//  FilmModel.swift
//  Movies
//
//  Created by Дмитрий Молодецкий on 04.07.2022.
//

import Foundation

enum FilmCategory: String, CaseIterable {
    case topRated = "top_rated", popular = "popular", nowPlaying = "now_playing", upcoming
    
    var nameForView: String {
        switch self {
        case .topRated: return "Топ"
        case .popular: return "Популярное"
        case .nowPlaying: return "Сейчас в кино"
        case .upcoming: return "Скоро в кино"
        }
    }
}

struct FilmsResponse: Decodable {
    let page: Int
    let results: [Film]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}

struct Film: Decodable {
    let id: Int
    let title, overview: String
    let voteAverage: Double
    let posterPath: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
