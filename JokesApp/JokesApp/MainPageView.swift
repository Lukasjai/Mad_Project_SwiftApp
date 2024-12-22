//
//  MainPageView.swift
//  JokesApp
//
//  Created by lukas jaiczay on 22.12.24.
//
import SwiftUI

struct MainPageView: View {
    @StateObject var viewModel: JokeViewModel
    var navigateToFavorites: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, admin!")
                .font(.title)

            Text(viewModel.joke)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 200)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            Button("Generate Joke") {
                viewModel.fetchJoke()
            }
            .buttonStyle(.bordered)

            Button("Save to Favorites") {
                viewModel.saveCurrentJoke()
            }
            .buttonStyle(.bordered)

            Button("Go to Favorites") {
                navigateToFavorites()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
