//
//  FavoritesView.swift
//  JokesApp
//
//  Created by lukas jaiczay on 22.12.24.
//
import SwiftUI
import CoreData

struct FavoritesView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteJoke.text, ascending: true)],
        animation: .default)
    private var favoriteJokes: FetchedResults<FavoriteJoke>

    var body: some View {
        List(favoriteJokes) { joke in
            Text(joke.text ?? "Unknown")
        }
        .navigationTitle("Favorite Jokes")
    }
}
