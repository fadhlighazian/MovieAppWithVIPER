//
//  HomePresenter.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import SwiftUI
import RxSwift

class HomePresenter: ObservableObject {
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  private let disposeBag = DisposeBag()
  
  @Published var nowPlaying: [NowPlayingModel] = []
  @Published var errorMessage: String = ""
  @Published var loadingState: Bool = false
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getNowPlaying() {
    loadingState = true
    homeUseCase.getNowPlaying()
      .observe(on: MainScheduler.instance)
      .subscribe { result in
        self.nowPlaying = result
      } onError: { error in
        self.errorMessage = error.localizedDescription
      } onCompleted: {
        self.loadingState = false
      }.disposed(by: disposeBag)
  }
  
  
  func linkBuilder<Content: View>(for movie: NowPlayingModel, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(for: movie)) {
      content()
    }
  }
}
