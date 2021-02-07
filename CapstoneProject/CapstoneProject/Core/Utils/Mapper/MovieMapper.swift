//
//  MovieMapper.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//
//let backdrop: String?
//let releaseDate: String?
//let popularity: String?
//let rating: String?
//let ratingCount: String?
//let genres: [Int] = []

import Foundation

final class NowPlayingMapper{
  // Response -> Model
  static func mapMovieResponseToDomains(input movieResponses: [NowPlaying]) -> [NowPlayingModel] {
    return movieResponses.map { result in
      return NowPlayingModel(
        id: result.id ?? 0,
        title: result.title ?? "Unknown",
        image: result.image ?? "Unknown",
        overview: result.overview ?? "Unknown",
        backdrop: result.backdrop ?? "Unknown",
        releaseDate: result.releaseDate ?? "Unknown",
        popularity: result.popularity ?? 0,
        rating: result.rating ?? 0,
        ratingCount: result.ratingCount ?? 0,
        originalLang: result.originalLang ?? "Unknown"
      )
    }
  }
  // Response -> Entity
  static func mapMovieResponseToEntities(input movieResponses: [NowPlaying]) -> [NowPlayingEntity] {
    return movieResponses.map { result in
      let newMovie = NowPlayingEntity()
      newMovie.id = result.id ?? 0
      newMovie.title = result.title ?? "Unknown"
      newMovie.image = result.image ?? "Unknown"
      newMovie.overview = result.overview ?? "Unknown"
      newMovie.backdrop = result.backdrop ?? "Unknown"
      newMovie.releaseDate = result.releaseDate ?? "Unknown"
      newMovie.popularity = result.popularity ?? 0
      newMovie.rating = result.rating ?? 0
      newMovie.ratingCount = result.ratingCount ?? 0
      newMovie.originalLang = result.originalLang ?? "Unknown"
      return newMovie
    }
  }
  // Entity -> Model
  static func mapMovieEntitiesToDomains(input movieEntities: [NowPlayingEntity]) -> [NowPlayingModel] {
    return movieEntities.map { result in
      return NowPlayingModel(
        id: result.id,
        title: result.title,
        image: result.image,
        overview: result.overview,
        backdrop: result.backdrop,
        releaseDate: result.releaseDate,
        popularity: result.popularity,
        rating: result.rating,
        ratingCount: result.ratingCount,
        originalLang: result.originalLang
      )
    }
  }
}

final class MovieDetailsMapper{
  // Response -> Model
  static func mapMovieResponseToDomains(input movieResponses: MovieDetails) -> MovieDetailsModel {
    return MovieDetailsModel(
        id: movieResponses.id ?? 0,
        title: movieResponses.title ?? "Unknown",
        image: movieResponses.image ?? "Unknown",
        overview: movieResponses.overview ?? "Unknown",
        backdrop: movieResponses.backdrop ?? "Unknown",
        releaseDate: movieResponses.releaseDate ?? "Unknown",
        popularity: movieResponses.popularity ?? 0,
        rating: movieResponses.rating ?? 0,
        ratingCount: movieResponses.ratingCount ?? 0,
        genres: Array(movieResponses.genres),
        languages: Array(movieResponses.languages),
        companies: Array(movieResponses.companies),
        countries: Array(movieResponses.countries)
      )
  }
}

final class FavoriteMapper{
  // Entity -> Model
  static func mapMovieEntitiesToDomains(input movieEntities: [FavoriteEntity]) -> [FavoriteModel] {
    return movieEntities.map { result in
      return FavoriteModel(
        id: result.id,
        title: result.title,
        image: result.image,
        overview: result.overview,
        backdrop: result.backdrop,
        releaseDate: result.releaseDate,
        popularity: result.popularity,
        rating: result.rating,
        ratingCount: result.ratingCount,
        originalLang: result.originalLang
      )
    }
  }
}
