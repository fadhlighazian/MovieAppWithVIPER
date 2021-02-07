//
//  DetailView.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 02/02/21.
//

import SwiftUI
import SDWebImageSwiftUI
import RealmSwift

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  @State var showsAlert = false
  @State var isClicked = false
  
  var body: some View {
    ZStack{
      Color.black.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical, showsIndicators: false){
        VStack(alignment: .leading){
          AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(self.presenter.details.backdrop)"))
            .indicator(SDWebImageActivityIndicator.large)
            .resizable()
            .scaledToFill()
            .cornerRadius(10)
            .shadow(radius:5)
            .padding(.bottom)
          HStack(alignment: .top){
            AnimatedImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(self.presenter.details.image)"))
              .indicator(SDWebImageActivityIndicator.large)
              .resizable()
              .frame(width: 106, height: 159)
              .scaledToFit()
              .cornerRadius(10)
              .shadow(radius:5)
            VStack(alignment: .leading){
              Text(self.presenter.details.title)
                .font(.system(size: 22))
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.top, 5)
                .padding(.bottom, 2)
              Text("Released on \(self.presenter.details.releaseDate)")
                .font(.system(size: 14))
                .foregroundColor(Color("secondColor"))
                .fontWeight(.regular)
                .padding(.bottom, 20)
              HStack{
                switch self.presenter.details.rating{
                case 5.0...6.9:
                  (Text(Image("star3")) + Text(String(format: " %.1f", self.presenter.details.rating))
                    .font(.system(size: 22))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                  )
                case 7.0...8.9:
                  (Text(Image("star4")) + Text(String(format: " %.1f", self.presenter.details.rating))
                    .font(.system(size: 22))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                  )
                case 9.0...10.0:
                  (Text(Image("star5")) + Text(String(format: " %.1f", self.presenter.details.rating))
                    .font(.system(size: 22))
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                  )
                default:
                  Text("")
                }
              }
              Text("Total vote \(self.presenter.details.ratingCount)")
                .font(.system(size: 14))
                .foregroundColor(Color("secondColor"))
                .fontWeight(.regular)
              
              HStack{
                Button(action: {
                  //                    self.presenter.addFavorite(
                  //                      Double(self.presenter.nowPlaying.id),
                  //                      self.presenter.nowPlaying.title,
                  //                      self.presenter.nowPlaying.image,
                  //                      self.presenter.nowPlaying.overview,
                  //                      self.presenter.nowPlaying.backdrop,
                  //                      self.presenter.nowPlaying.releaseDate,
                  //                      self.presenter.nowPlaying.popularity,
                  //                      self.presenter.nowPlaying.rating,
                  //                      self.presenter.nowPlaying.ratingCount,
                  //                      self.presenter.nowPlaying.originalLang
                  //                    )
                  //                    DispatchQueue.main.async {
                  //                      isClicked = true
                  //                      self.showsAlert.toggle()
                  //                                      }
                  self.isClicked.toggle()
                }) {
                  Text("Add to favorite")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(maxWidth:.infinity, alignment: .center)
                }
                .padding(.all,7)
                .frame(maxWidth:.infinity, alignment:.topLeading)
                .background(Color(.yellow))
                .cornerRadius(5)
                
                if isClicked == true{
                  //                  Button(action: {
                  //
                  //                  })
                  //                  {
                  //                    Text("Has been added to favorite")
                  //                      .font(.system(size: 14))
                  //                      .fontWeight(.bold)
                  //                      .foregroundColor(Color.black)
                  //                      .frame(maxWidth:.infinity, alignment: .center)
                  //                  }.disabled(true)
                  //                  .padding(.all,7)
                  //                  .frame(maxWidth:.infinity, alignment:.topLeading)
                  //                  .background(Color("myGray"))
                  //                  .cornerRadius(5)
                  //                }
                }
              }
            }.padding(.leading, 15)
          }
          
          Text("Sinopsis")
            .font(.system(size: 22))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding(.top, 10)
            .padding(.bottom, 10)
          Text(self.presenter.details.overview)
            .font(.system(size: 14))
            .foregroundColor(Color("secondColor"))
            .fontWeight(.regular)
          
        }.padding(.horizontal, 30).padding(.vertical, 30)
      }
    }
    //  .alert(isPresented: $showsAlert){
    //  Alert(title: Text("Success!"), message: Text("\"\(self.presenter.nowPlaying.title)\" has been added to favorite"), dismissButton: .default(Text("OK")))
    //  }
    .onAppear() {
      checkExistingData(self.presenter.details.id)
    }
  } // Closing Tag Body
  
  func checkExistingData(_ id: Int64) {
    let fav = FavoriteEntity()
    if fav.id == id {
      isClicked = false
    } else {
      isClicked = true
    }
  }
}

