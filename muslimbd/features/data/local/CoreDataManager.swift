//
//  CoreDataManager.swift
//  muslimbd
//
//  Created by Al Faruk on 30/12/24.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MuslimbdDatabase")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            } else {
                print("Sussecfully loaded core data :)")
            }
        }
    }
    
    func saveCategories(category: CategoryEntity){
        let cat = CategoryEntity(context: persistentContainer.viewContext)
        cat.id = category.id
        cat.name = category.name
        cat.contentBaseURL = category.contentBaseURL
        cat.imageURL = category.imageURL
        cat.about = category.about
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save category \(error)")
        }
    }
    
    func getCategories() -> [CategoryEntity] {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.getchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
}
