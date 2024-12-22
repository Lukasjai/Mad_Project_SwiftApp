    //
//  FavouriteJokes.swift
//  JokesApp
//
//  Created by lukas jaiczay on 21.12.24.
//

import CoreData

extension FavoriteJoke {
    static func saveJoke(_ joke: String, context: NSManagedObjectContext) {
        let newFavorite = FavoriteJoke(context: context)
        newFavorite.text = joke

        do {
            try context.save()
            print("Joke saved successfully")
        } catch {
            print("Failed to save joke: \(error)")
        }
    }

    static func fetchAllJokes(context: NSManagedObjectContext) -> [FavoriteJoke] {
        let request = FavoriteJoke.fetchRequest() 
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch jokes: \(error)")
            return []
        }
    }
}





