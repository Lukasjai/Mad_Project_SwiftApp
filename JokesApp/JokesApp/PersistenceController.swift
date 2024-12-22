//
//  PersistenceController.swift
//  JokesApp
//
//  Created by lukas jaiczay on 21.12.24.
//
import CoreData


struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "JokesModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
}
