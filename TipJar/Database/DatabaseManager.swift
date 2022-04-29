//
//  DatabaseManager.swift
//  TipJar
//
//  Created by Azhar Islam on 29/04/2022.
//

import Foundation
import CoreData

class DatabaseManager {
    
    static let instance = DatabaseManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    init() {
        container = NSPersistentContainer(name: "TipContainer")

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
