//
//  MovieRepository.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import RxSwift

// Protocol MovieRepositoryProtocol
protocol MovieRepositoryProtocol {
  func getNowPlaying() -> Observable<[NowPlayingModel]>
  func getDetails(_ id: Int64) -> Observable<MovieDetailsModel>
  func getFavorite() -> Observable<[FavoriteModel]>
  func addFavorite(
    _ id: Double,
    _ title: String,
    _ image: String,
    _ overview: String,
    _ backdrop: String,
    _ releaseDate: String,
    _ popularity: Double,
    _ rating: Double,
    _ ratingCount: Int64,
    _ originalLang: String
  )
}

// Class MovieRepository
final class MovieRepository: NSObject{
  
  typealias MovieInstance = (LocaleDataSource, RemoteDataSource) -> MovieRepository
  fileprivate let locale: LocaleDataSource
  fileprivate let remote: RemoteDataSource
  
  private init(locale: LocaleDataSource, remote: RemoteDataSource){
    self.locale = locale
    self.remote = remote
  }
  
  // Panggil Instance dari Local dan Remote sebelum menyediakan MovieRepository
  static let sharedInstance: MovieInstance = { localeRepo, remoteRepo in
    return MovieRepository(locale: localeRepo, remote: remoteRepo)
  }
}

// Extension Class MovieRepository
extension MovieRepository: MovieRepositoryProtocol {
  
  func getNowPlaying() -> Observable<[NowPlayingModel]> {
    return self.locale.getNowPlaying()
      .map { NowPlayingMapper.mapMovieEntitiesToDomains(input: $0) }
      .filter { !$0.isEmpty }
      .ifEmpty(switchTo: self.remote.getNowPlaying()
                .map { NowPlayingMapper.mapMovieResponseToEntities(input: $0) }
                .flatMap { self.locale.addNowPlaying(from: $0) }
                .filter { $0 }
                .flatMap { _ in self.locale.getNowPlaying()
                  .map { NowPlayingMapper.mapMovieEntitiesToDomains(input: $0) }
                }
      )
  }
  
  func getDetails(_ id: Int64) -> Observable<MovieDetailsModel> {
    return self.remote.getDetails(id)
      .map { MovieDetailsMapper.mapMovieResponseToDomains(input: $0) }

  }
  
  func getFavorite() -> Observable<[FavoriteModel]> {
    return self.locale.getFavorite()
      .map { FavoriteMapper.mapMovieEntitiesToDomains(input: $0) }
      .filter { !$0.isEmpty }
  }
  
  func addFavorite(
    _ id: Double,
    _ title: String,
    _ image: String,
    _ overview: String,
    _ backdrop: String,
    _ releaseDate: String,
    _ popularity: Double,
    _ rating: Double,
    _ ratingCount: Int64,
    _ originalLang: String
  ) {
    return locale.addFavorite(id, title, image, overview, backdrop, releaseDate, popularity, rating, ratingCount, originalLang)
  }
}
