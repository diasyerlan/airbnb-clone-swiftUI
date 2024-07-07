//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 07.07.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var location = ""
    @Published var listings = [Listing]()
    var originalListings = [Listing]()
    var service: ExploreService
    init(service: ExploreService) {
        self.service = service
        Task {
            await fetchListings()
        }
    }
    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
            originalListings = listings
        }
        catch {
            print("Error in loading data - \(error.localizedDescription)")
        }
    }
    
    func updateListingBySearch() {
        let filteredListings = listings.filter {
            $0.city == location || $0.state == location
        }
        self.listings = filteredListings.isEmpty ? originalListings : filteredListings
    }
}
