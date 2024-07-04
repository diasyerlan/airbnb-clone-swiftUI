//
//  ListingCarouselView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 03.07.2024.
//

import SwiftUI

struct ListingCarouselView: View {
    var body: some View {
        TabView {
            ForEach(0..<4, id: \.self) { _ in
                Rectangle()
                    .foregroundColor(.black)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingCarouselView()
}
