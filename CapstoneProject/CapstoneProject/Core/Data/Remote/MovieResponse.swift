//
//  MovieResponse.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 28/01/21.
//

import Foundation
import Combine

// Now Playing Response
struct NowPlayingResponse: Codable, Hashable{
  let results: [NowPlaying]
}

struct NowPlaying: Codable, Hashable{
  let id: Int64?
  let title: String?
  let image: String?
  let overview: String?
  let backdrop: String?
  let releaseDate: String?
  let popularity: Double?
  let rating: Double?
  let ratingCount: Int64?
  let originalLang: String?
  
  private enum CodingKeys: String, CodingKey{
    case id, title, overview, popularity
    case image = "poster_path"
    case backdrop = "backdrop_path"
    case releaseDate = "release_date"
    case rating = "vote_average"
    case ratingCount = "vote_count"
    case originalLang = "original_language"
  }
}

// Detail Response
struct MovieDetails: Codable, Hashable{
  let id: Int64?
  let title: String?
  let image: String?
  let overview: String?
  let backdrop: String?
  let releaseDate: String?
  let popularity: Double?
  let rating: Double?
  let ratingCount: Int64?
  
  let genres: [String] = []
  let languages: [String] = []
  let companies: [String] = []
  let countries: [String] = []
  
  private enum CodingKeys: String, CodingKey{
    case id, title, overview, popularity, genres
    case image = "poster_path"
    case backdrop = "backdrop_path"
    case releaseDate = "release_date"
    case rating = "vote_average"
    case ratingCount = "vote_count"
    case languages = "spoken_languages"
    case companies = "production_companies"
    case countries = "production_countries"
  }
}
