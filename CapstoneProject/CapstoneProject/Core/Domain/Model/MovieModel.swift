//
//  MovieModel.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import Combine

struct NowPlayingModel: Equatable, Identifiable, Hashable{
  let id: Int64
  let title: String
  let image: String
  let overview: String
  let backdrop: String
  let releaseDate: String
  let popularity: Double
  let rating: Double
  let ratingCount: Int64
  let originalLang: String
}

struct FavoriteModel: Equatable, Identifiable, Hashable{
  let id: Int64
  let title: String
  let image: String
  let overview: String
  let backdrop: String
  let releaseDate: String
  let popularity: Double
  let rating: Double
  let ratingCount: Int64
  let originalLang: String
}

struct MovieDetailsModel: Equatable, Identifiable, Hashable{
  let id: Int64
  let title: String
  let image: String
  let overview: String
  let backdrop: String
  let releaseDate: String
  let popularity: Double
  let rating: Double
  let ratingCount: Int64
  let genres: [String]
  let languages: [String]
  let companies: [String]
  let countries: [String]

}
