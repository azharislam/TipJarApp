//
//  DatabaseManager.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import Foundation
import CoreData

/// Core Data abstraction
/// Storage type for testing

enum StorageType {
    case persistent, inMemory
}

final class CoreDataStoreManager {
    
    static let instance = CoreDataStoreManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init(_ storageType: StorageType = .persistent) {
        container = NSPersistentContainer(name: Constants.DataModel.container)
        
        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: Constants.DataModel.nullDirectory)
            self.container.persistentStoreDescriptions = [description]
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)") // Error alert handler views
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error.localizedDescription)") // Error alert handler views
        }
    }
}
