//
//  DatabaseManager.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import Foundation
import CoreData

/// Core Data abstraction

final class CoreDataStoreManager {
    
    static let instance = CoreDataStoreManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: Constants.DataModel.container)
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data. \(error.localizedDescription)")
        }
    }
}
