//
//  HomeRouter.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 01/02/21.
//

import SwiftUI

class HomeRouter {
  func makeDetailView(for movie: NowPlayingModel) -> some View {
    
    let detailUseCase = Injection.init().provideDetail(movie.id)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    
    return DetailView(presenter: presenter)
  }
}
