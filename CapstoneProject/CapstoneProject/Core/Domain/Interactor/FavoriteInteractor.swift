//
//  FavoriteInteractor.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 03/02/21.
//

import Foundation
import RxSwift

// Use Case
protocol FavoriteUseCase {
  func getFavorite() -> Observable<[FavoriteModel]>
}

// Class HomeInteractor that implement Use Case
class FavoriteInteractor: FavoriteUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getFavorite() -> Observable<[FavoriteModel]> {
    return repository.getFavorite()
  }
}
