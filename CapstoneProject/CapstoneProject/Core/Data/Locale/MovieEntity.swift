//
//  MovieEntity.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import Foundation
import RealmSwift

class NowPlayingEntity: Object{
  @objc dynamic var id: Int64 = 0
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var overview: String = ""
  @objc dynamic var backdrop: String = ""
  @objc dynamic var releaseDate: String = ""
  @objc dynamic var popularity: Double = 0
  @objc dynamic var rating: Double = 0
  @objc dynamic var ratingCount: Int64 = 0
  @objc dynamic var originalLang: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
}

class FavoriteEntity: Object{
  @objc dynamic var id: Int64 = 0
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var overview: String = ""
  @objc dynamic var backdrop: String = ""
  @objc dynamic var releaseDate: String = ""
  @objc dynamic var popularity: Double = 0
  @objc dynamic var rating: Double = 0
  @objc dynamic var ratingCount: Int64 = 0
  @objc dynamic var originalLang: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
