//
//  FavoritePresenter.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 02/02/21.
//

import SwiftUI
import RxSwift

class FavoritePresenter: ObservableObject {
//  private let router = FavoriteRouter()
  private let favoriteUseCase: FavoriteUseCase
  private let disposeBag = DisposeBag()
  
  @Published var favorite: [FavoriteModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(favoriteUseCase: FavoriteUseCase) {
    self.favoriteUseCase = favoriteUseCase
  }
  
  func getFavorite() {
    loadingState = true
    favoriteUseCase.getFavorite()
      .observe(on: MainScheduler.instance)
      .subscribe { result in
        self.favorite = result
      } onError: { error in
        self.errorMessage = error.localizedDescription
      } onCompleted: {
        self.loadingState = false
      }.disposed(by: disposeBag)
  }
  
//  func linkBuilder<Content: View>(for favorite: FavoriteModel, @ViewBuilder content: () -> Content) -> some View {
//    NavigationLink(destination: router.makeDetailView(for: favorite)) {
//      content()
//    }
//  }
  
}
