//
//  JokeViewModel.swift
//  JokesApp
//
//  Created by lukas jaiczay on 22.12.24.
//

import Foundation
import CoreData

class JokeViewModel: ObservableObject {
    @Published var joke: String = "Welcome to the app! Generate a joke!"
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.viewContext) {
        self.context = context
    }

    func fetchJoke() {
        // Mock API Call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.joke = "This is a random joke!"
        }
    }

    func saveCurrentJoke() {
        let newFavorite = FavoriteJoke(context: context)
        newFavorite.text = joke
        do {
            try context.save()
        } catch {
            print("Failed to save joke: \(error)")
        }
    }
}
