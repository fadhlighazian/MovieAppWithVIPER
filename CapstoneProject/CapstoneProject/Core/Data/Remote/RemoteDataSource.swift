//
//  RemoteDataSource.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 28/01/21.
//

import Foundation
import Alamofire
import RxSwift

// Protocol RemoteDataSourceProtocol
protocol RemoteDataSourceProtocol: class{
  func getNowPlaying() -> Observable <[NowPlaying]>
  func getDetails(_ id: Int64) -> Observable <MovieDetails>
}

// Class RemoteDataSource
final class RemoteDataSource: NSObject{
  let apiKey = "02b26526598c878b02d249743e3f3373"
  let language = "en-US"
  let page = "1"
  
  private override init() { }
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

// Extension RemoteDataSource
extension RemoteDataSource: RemoteDataSourceProtocol{
  
  func getNowPlaying() -> Observable<[NowPlaying]> {
    guard var components = URLComponents(string: Endpoints.Gets.nowPlaying.url) else { return URLError.invalidResponse as! Observable<[NowPlaying]> }
    
    components.queryItems = [
      URLQueryItem(name: "api_key", value: apiKey),
      URLQueryItem(name: "language", value: language),
      URLQueryItem(name: "page", value: page)
    ]
    let request = URLRequest(url: components.url!)
    
    //Create an RxSwift observable, which will be the one to call the request when subscribed to
    return Observable<[NowPlaying]>.create { observer in
      if let url = URL(string: "\(request)"){
        //Trigger the HttpRequest using AlamoFire (AF)
        AF.request(url).validate().responseDecodable(of: NowPlayingResponse.self) { response in
          //Check the result from Alamofire's response and check if it's a success or a failure
          switch response.result{
          case .success(let value):
            // return the value in onNext into observer
            observer.onNext(value.results)
            observer.onCompleted()
          case .failure:
            observer.onError(URLError.invalidResponse)
          }
        }
      }
      //Finally, we return a disposable to stop the request
      return Disposables.create()
    }
  }
  
  func getDetails(_ id: Int64) -> Observable<MovieDetails> {
    guard var components = URLComponents(string: "\(Endpoints.Gets.detail.url)\(id)") else { return URLError.invalidResponse as! Observable<MovieDetails> }
    components.queryItems = [
      URLQueryItem(name: "api_key", value: apiKey),
      URLQueryItem(name: "language", value: language),
      URLQueryItem(name: "page", value: page)
    ]
    let request = URLRequest(url: components.url!)
    
    return Observable<MovieDetails>.create { observer in
      if let url = URL(string: "\(request)"){
        AF.request(url).responseDecodable(of: MovieDetails.self) { response in
          switch response.result{
          case .success(let value):
            observer.onNext(value)
            observer.onCompleted()
          case .failure:
            observer.onError(URLError.invalidResponse)
          }
        }
      }
      return Disposables.create()
    }
  }
}
