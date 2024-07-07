//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 04.07.2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case location, date, guests
}

struct DestinationSearchView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool
    @State private var selectedOption = DestinationSearchOptions.location
    @State private var guestNumber = 0
    @State private var startDate = Date()
    @State private var endDate = Date()

    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                        viewModel.updateListingBySearch()
                    }
                }
            label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
                Spacer()
                if !viewModel.location.isEmpty {
                    Button {
                        viewModel.location = ""
                        viewModel.updateListingBySearch()
                    } label: {
                        Text("Clear")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding()
            VStack(alignment: .leading) {
                if(selectedOption == .location) {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search destinations", text: $viewModel.location)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingBySearch()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(Color(.systemGray4))
                    }
                }
                else {
                    CollapsedPickerView(title: "Where", description: "Add places")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .padding()
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            VStack(alignment: .leading) {
                if(selectedOption == .date) {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Divider()
                    DatePicker("To", selection: $endDate, displayedComponents: .date)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)

                }
                else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                    
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .date ? 180 : 64)
            .padding(.horizontal)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .date
                }
            }
            
            VStack(alignment: .leading) {
                if(selectedOption == .guests) {
                    
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(guestNumber) Adults")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    } onIncrement: {
                        guestNumber += 1
                    } onDecrement: {
                        guard guestNumber > 0 else { return }
                        guestNumber -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .padding()
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            Spacer()
        }
        
    }
}
#Preview {
    DestinationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
        
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
