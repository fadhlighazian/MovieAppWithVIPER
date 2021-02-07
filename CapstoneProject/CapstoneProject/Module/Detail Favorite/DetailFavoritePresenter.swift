//
//  DetailFavoritePresenter.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 06/02/21.
//

import Foundation

class DetailFavoritePresenter: ObservableObject {
  
  private let detailFavoriteUseCase: DetailFavoriteUseCase
  
  @Published var favorite: FavoriteModel
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(detailFavoriteUseCase: DetailFavoriteUseCase) {
    self.detailFavoriteUseCase = detailFavoriteUseCase
    favorite = detailFavoriteUseCase.getFavorite()
  }
  
}
