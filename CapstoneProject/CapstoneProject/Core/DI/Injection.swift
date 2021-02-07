//
//  Injection.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import RealmSwift

// Injection bekerja dan menyediakan UseCase untuk Presenter
final class Injection: NSObject {
  
  // Provide MovieRepository
  private func provideRepository() -> MovieRepositoryProtocol {
    let realm = try? Realm()
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return MovieRepository.sharedInstance(locale,remote)
  }
  
  // Provide UseCase for HomePresenter
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }
  
  // Provide UseCase for DetailPresenter
  func provideFavorite() -> FavoriteUseCase {
    let repository = provideRepository()
    return FavoriteInteractor(repository: repository)
  }
  
  // Provide UseCase for DetailPresenter
  func provideDetail(_ id: Int64) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, id: id)
  }
}
