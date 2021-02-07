//
//  HomeInteractor.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import RxSwift

// Use Case
protocol HomeUseCase {
  func getNowPlaying() -> Observable<[NowPlayingModel]>
}

// Class HomeInteractor that implement Use Case
class HomeInteractor: HomeUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getNowPlaying() -> Observable<[NowPlayingModel]> {
    return repository.getNowPlaying()
  }
}
