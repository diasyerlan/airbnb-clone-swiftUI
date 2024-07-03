//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 02.07.2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar()
                LazyVStack {
                    ForEach(0...10, id: \.self) { listing in
                        ListingItemView()
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
