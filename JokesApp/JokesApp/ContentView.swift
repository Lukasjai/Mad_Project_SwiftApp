//
//  ContentView.swift
//  JokesApp
//
//  Created by lukas jaiczay on 21.12.24.
//
import SwiftUI

@main
struct JokesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\EnvironmentValues.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}



struct ContentView: View {
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LoginView(onLoginSuccess: {
                navigationPath.append("MainPage")
            })
                .navigationDestination(for: String.self) { destination in
                    switch destination {
                    case "MainPage":
                        MainPageView(viewModel: JokeViewModel(), navigateToFavorites: {
                            navigationPath.append("Favorites")
                        })
                    case "Favorites":
                        FavoritesView()
                    default:
                        Text("Unknown Destination")
                    }
                }
        }
    }
}
