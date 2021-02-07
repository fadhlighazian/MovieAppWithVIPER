//
//  DetailPresenter.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 01/02/21.
//

import SwiftUI
import RxSwift

class DetailPresenter: ObservableObject {
  
  private let detailUseCase: DetailUseCase
  private let disposeBag = DisposeBag()
  
  @Published var details: MovieDetailsModel
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    details = detailUseCase.getDetails()
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
    return detailUseCase.addFavorite(id, title, image, overview, backdrop, releaseDate, popularity, rating, ratingCount, originalLang)
  }

}
