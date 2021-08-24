//
//  SimilarDTO.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

struct SimilarDTO: Decodable {
    var page: Int
    var results: [SimilarResultsDTO]
    var totalResults: Int
    var totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct SimilarResultsDTO: Decodable {
    
    var posterPath : String?
    var popularity: Double
    var id: Int
    var backdropPath: String?
    var voteAverage: Double
    var overview: String
    var name: String
    var originalName: String
    var voteCount: Int
    var firstAirDate: String
    var originCountry: [String]
    var genreIds: [Int]
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case popularity
        case id
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case overview
        case name
        case originalName = "original_name"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIds = "genre_ids"
    }
}
