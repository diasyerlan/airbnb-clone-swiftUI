//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 07.07.2024.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        DeveloperPreview.shared.listings
    }
}
