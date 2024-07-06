//
//  ListingCarouselView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 03.07.2024.
//

import SwiftUI

struct ListingCarouselView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { img in
                Image(img)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingCarouselView(listing: DeveloperPreview.shared.listings[1])
}
