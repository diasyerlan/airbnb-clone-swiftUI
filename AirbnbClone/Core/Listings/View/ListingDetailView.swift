//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 03.07.2024.
//

import MapKit
import SwiftUI


struct ListingDetailView: View {
    let listing: Listing
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 48)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text(listing.roundedRating)
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                        
                    }
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) 3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle)
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features, id: \.self) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...listing.numberOfBeds, id: \.self) { index in
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(index)")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities) { item in
                    HStack {
                        Image(systemName: item.imageName)
                            .frame(width: 32)
                        Text(item.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                        Text("Oct 15 - 20")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    Spacer()
                    Button{} label: {
                        Text("Reserve")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }

    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
