//
//  ViewModifiers.swift
//  CapstoneProject
//
//  Created by Ghazian Fadhli Fakhrusy on 01/02/21.
//

import SwiftUI

struct CategoryText: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(.white)
      .padding(.leading, 5)
  }
}

struct MainPosterStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 106, height: 159)
      .scaledToFit()
      .cornerRadius(10)
      .shadow(radius:5)
  }
}

