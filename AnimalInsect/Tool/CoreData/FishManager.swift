//
//  FishManager.swift
//  AnimalFish


import Foundation
import CoreData

class FishDataManager {
    static let shared = FishDataManager()

    func add(_ fish: Value) {
        if let entity = NSEntityDescription.entity(forEntityName: "InsectData",in:CoreDataManager.shared.persistentContainer.viewContext) {
            let insectData = InsectData(entity: entity, insertInto: CoreDataManager.shared.persistentContainer.viewContext)
            insectData.name = fish.name.nameTWzh
            insectData.iconURI = fish.iconURI
            insectData.imageURI = fish.imageURI
            insectData.monthArrayNorthern = fish.availability.monthArrayNorthern
            insectData.monthArraySouthern = fish.availability.monthArraySouthern
            insectData.timeArray = fish.availability.timeArray
            insectData.location = fish.availability.location
            insectData.rarity = fish.availability.rarity?.changeToChinese()
            insectData.price = Int16(fish.price)
            
            CoreDataManager.shared.saveContext()
        }
    }
    
    func fetchAll() -> [InsectData]? {
        let request: NSFetchRequest<InsectData> = InsectData.fetchRequest()
        ///SQL語法
        do {
            let results = try CoreDataManager.shared.persistentContainer.viewContext.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func delete(_ fish: InsectData) {
        CoreDataManager.shared.persistentContainer.viewContext.delete(fish)
        CoreDataManager.shared.saveContext()
    }
}

extension InsectData {
    func changeToValue() -> Value {
        
        let value = Value(
            id: 0,
            name: Name(nameTWzh: self.name ?? ""),
            availability: Availability(location: self.location ?? "",
                                       rarity: Rarity(rawValue: self.rarity ?? ""),
                                       monthArrayNorthern: self.monthArrayNorthern ?? [],
                                       monthArraySouthern: self.monthArraySouthern ?? [],
                                       timeArray: self.timeArray ?? []),
            price: Int(self.price),
            imageURI: self.imageURI ?? "",
            iconURI: self.iconURI ?? "")
        
        return value
    }
    
    
}
