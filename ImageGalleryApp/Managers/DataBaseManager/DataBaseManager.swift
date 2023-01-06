//
//  DataBaseManager.swift
//  ImageGalleryApp
//
//  Created by Alexander on 05.01.2023.
//

import CoreData

class DatabaseManager: DatabaseManagerProtocol {
    
    static let shared = DatabaseManager()
    
    private var container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: Constants.Coredata.container)
        container.loadPersistentStores { description, error in
            Logger.info("Description: \(description), Error: \(error?.localizedDescription ?? "Nil")")
        }
        container.viewContext.mergePolicy = NSOverwriteMergePolicy
    }
    
    func save() {
        saveContext()
    }
    
    func isImageExists(for id: String) -> Bool {
        let request: NSFetchRequest<ImageEntity> = .init(entityName: String(describing: ImageEntity.self))
        request.fetchLimit = 1
        request.predicate = .init(format: "id == '\(id)'")
        
        do {
            return try context.fetch(request).first != nil
        } catch {
            Logger.error(error)
            return false
        }
    }
    
    func fetchImages(page: Int, limit: Int) -> [ImageModel] {
        let request: NSFetchRequest<ImageEntity> = .init(entityName: String(describing: ImageEntity.self))
        request.fetchOffset = limit * (page - 1)
        request.fetchLimit = limit
        
        return models(request: request)
    }
    
    func fetchImages() -> [ImageModel] {
        models()
    }
    
    func removeImage(with id: String) {
        let request: NSFetchRequest<ImageEntity> = .init(entityName: String(describing: ImageEntity.self))
        request.fetchLimit = 1
        request.predicate = .init(format: "id == '\(id)'")
        
        do {
            guard let object = try context.fetch(request).first else {
                return
            }
            context.delete(object)
            Logger.info("Deletion completed")
        } catch {
            Logger.error(error)
        }
    }
    
    private func models<T: Coredatable>(request: NSFetchRequest<T.ModelType>? = nil) -> [T] {
        let modelsRequest: NSFetchRequest<T.ModelType>
        if let request = request {
            modelsRequest = request
        } else {
            modelsRequest = .init(entityName: String(describing: T.ModelType.self))
        }
        
        do {
            let result = try context.fetch(modelsRequest)
            let model: [T]? = result.mapToModels() as? [T]
            return model ?? []
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func saveContext() {
        context.performAndWait {
            guard context.hasChanges else { return }
            
            do {
                try context.save()
                Logger.info("Saving completed")
            } catch {
                Logger.error(error)
            }
            
        }
    }
    
}
