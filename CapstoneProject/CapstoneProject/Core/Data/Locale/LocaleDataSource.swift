//
//  LocaleDataSource.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import RealmSwift
import RxSwift

// Protocol LocaleDataSourceProtocol
protocol LocaleDataSourceProtocol: class {
  func getNowPlaying() -> Observable<[NowPlayingEntity]>
  func addNowPlaying(from movies: [NowPlayingEntity]) -> Observable<Bool>
  
  func getFavorite() -> Observable<[FavoriteEntity]>
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

// Class LocaleDataSource
final class LocaleDataSource: NSObject {
  private let realm: Realm?
  
  private init(realm: Realm?) {
    self.realm = realm
  }
  
  static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
    return LocaleDataSource(realm: realmDatabase)
  }
}

// Extension Class LocaleDataSource
extension LocaleDataSource: LocaleDataSourceProtocol {
  
  // NowPlaying Section
  func getNowPlaying() -> Observable<[NowPlayingEntity]> {
    return Observable<[NowPlayingEntity]>.create { observer in
      if let realm = self.realm {
        let movies: Results<NowPlayingEntity> = {
          realm.objects(NowPlayingEntity.self)
            .sorted(byKeyPath: "title", ascending: true)
        }()
        observer.onNext(movies.toArray(ofType: NowPlayingEntity.self))
        observer.onCompleted()
      } else {
        observer.onError(DatabaseError.invalidInstance)
      }
      return Disposables.create()
    }
  }
  
  func addNowPlaying(from movies: [NowPlayingEntity]) -> Observable<Bool> {
    return Observable<Bool>.create { observer in
      if let realm = self.realm {
        do{
          try realm.write {
            for movie in movies {
              realm.add(movie, update: .all)
            }
            observer.onNext(true)
            observer.onCompleted()
          }
        } catch {
          observer.onError(DatabaseError.requestFailed)
        }
      } else {
        observer.onError(DatabaseError.invalidInstance)
      }
      return Disposables.create()
    }
  }
  
  // Favorite Section
  func getFavorite() -> Observable<[FavoriteEntity]> {
    return Observable<[FavoriteEntity]>.create { observer in
      if let realm = self.realm {
        let movies: Results<FavoriteEntity> = {
          realm.objects(FavoriteEntity.self)
            .sorted(byKeyPath: "title", ascending: true)
        }()
        observer.onNext(movies.toArray(ofType: FavoriteEntity.self))
        observer.onCompleted()
      } else {
        observer.onError(DatabaseError.invalidInstance)
      }
      return Disposables.create()
    }
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
  ){
    let config = Realm.Configuration(schemaVersion: 1)
    do {
      let realm = try Realm(configuration: config)
      let newData = FavoriteEntity()
      newData.id = Int64(id)
      newData.title = title
      newData.image = image
      newData.overview = overview
      newData.backdrop = backdrop
      newData.releaseDate = releaseDate
      newData.popularity = popularity
      newData.rating = rating
      newData.ratingCount = ratingCount
      newData.originalLang = originalLang
      try realm.write({
        realm.add(newData)
        print("success")
      })
    } catch {
      print(error.localizedDescription)
    }
  }
  
}

extension Results{
  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }
}
