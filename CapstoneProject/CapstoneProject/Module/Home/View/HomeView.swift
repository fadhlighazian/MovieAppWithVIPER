//
//  HomeView.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 29/01/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    NavigationView{
      ZStack{
        Color.black.edgesIgnoringSafeArea(.all)
        VStack(alignment:.leading){
          if presenter.loadingState {
            VStack {
              Text("Loading...")
              ActivityIndicator()
            }
          } else {
            VStack(alignment: .leading){
              ScrollView(.vertical, showsIndicators: false) {
                ForEach(self.presenter.nowPlaying, id: \.id){ movie in
                  self.presenter.linkBuilder(for: movie) {
                    HStack(alignment: .top){
                      AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.image)"))
                        .indicator(SDWebImageActivityIndicator.medium)
                        .resizable()
                        .modifier(MainPosterStyle())
                      VStack(alignment: .leading){
                        Text(movie.title)
                          .font(.title2)
                          .fontWeight(.bold)
                          .foregroundColor(Color.white)
                          .padding(.top, 8)
                        Text(movie.overview)
                          .font(.body)
                          .fontWeight(.light)
                          .foregroundColor(Color(.systemGray4))
                          .padding(.top, 8)
                          .lineLimit(3)
                      }.padding(.horizontal, 10)
                    }.padding(.horizontal).padding(.bottom, 10)
                  }
                }.listStyle(PlainListStyle())
              }
            }
          }
        }
      }
      //      .navigationBarTitle(Text("The Movie DB"), displayMode: .inline)
    }
    .onAppear {
      if self.presenter.nowPlaying.count == 0 {
        self.presenter.getNowPlaying()
      }
    }
  }
}

