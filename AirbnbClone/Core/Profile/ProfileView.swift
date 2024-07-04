//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Dias Yerlan on 05.07.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Log in to start planning your next trip.")
                    }
                    Button {} label: {
                        Text("Log in")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 48)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                }
                VStack(spacing: 24) {
                    ProfileOptionRowView(title: "Settings", image: "gear")
                    ProfileOptionRowView(title: "Accessibility", image: "gear")
                    ProfileOptionRowView(title: "Visit The Help Center", image: "questionmark.circle")

                }
                .padding(.vertical)
            }
            .padding()
    }
}

#Preview {
    ProfileView()
}

struct ProfileOptionRowView: View {
    let title: String
    let image: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}
