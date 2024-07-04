//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 02.07.2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDesinationSearchView = false
    var body: some View {
        NavigationStack {
            if showDesinationSearchView {
                DestinationSearchView(show: $showDesinationSearchView)
            }
            else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDesinationSearchView.toggle()
                            }
                        }
                    LazyVStack {
                        ForEach(0...10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
