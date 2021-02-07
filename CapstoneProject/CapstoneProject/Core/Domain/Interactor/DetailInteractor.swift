//
//  DetailInteractor.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 01/02/21.
//

import Foundation
import RxSwift

protocol DetailUseCase {
  func getDetails() -> Observable<MovieDetailsModel>
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

class DetailInteractor: DetailUseCase {
  
  private let repository: MovieRepositoryProtocol
  private let id: Int64
  
  required init(repository: MovieRepositoryProtocol, id: Int64) {
    self.repository = repository
    self.id = id
  }
  
  func getDetails() -> Observable<MovieDetailsModel> {
    return repository.getDetails(id)
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
    return repository.addFavorite(id, title, image, overview, backdrop, releaseDate, popularity, rating, ratingCount, originalLang)
  }
}
