//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 02.07.2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    @State private var showDesinationSearchView = false
    var body: some View {
        NavigationStack {
            if showDesinationSearchView {
                DestinationSearchView(viewModel: viewModel, show: $showDesinationSearchView)
            }
            else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.location)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDesinationSearchView.toggle()
                            }
                        }
                    LazyVStack {
                        ForEach(viewModel.listings, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
