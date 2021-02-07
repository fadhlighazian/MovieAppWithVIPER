//
//  APICall.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 28/01/21.
//

import Foundation

struct API{
  static let baseURL = "https://api.themoviedb.org/3/movie/"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints{
  enum Gets: Endpoint {
    case nowPlaying
    case detail

    public var url: String{
      switch self {
      case .nowPlaying: return "\(API.baseURL)now_playing"
      case .detail: return "\(API.baseURL)"
      }
    }
  }
}
