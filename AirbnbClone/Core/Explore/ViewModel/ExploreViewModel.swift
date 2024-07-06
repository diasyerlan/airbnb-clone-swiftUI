//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 07.07.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
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
        }
        catch {
            print("Error in loading data - \(error.localizedDescription)")
        }
    }
}
