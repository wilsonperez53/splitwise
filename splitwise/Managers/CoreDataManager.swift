//
//  CoreDataManager.swift
//  splitwise
//
//  Created by Estudiantes on 4/14/21.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        // Which files should the container use.
        persistentContainer = NSPersistentContainer(name: "SplitwiseModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("Unable to load Core Data Store \(error)")
            }
        }
    }
    
    func agregarDeudor(nombreDeudor: String){
        let deudorEntity = SplitwiseEntity(context: persistentContainer.viewContext)
        deudorEntity.deudor = nombreDeudor
  
        if (try? persistentContainer.viewContext.save()) != nil{
            print("Success to save")
        }else{
            print("Failed to save")
        }
    }
    
    func saveContext(){
        if (try? persistentContainer.viewContext.save()) != nil{
            print("Success to save")
        }else{
            print("Failed to save")
        }
    }
    
    func actualizarDeudas(deudor: SplitwiseEntity){
       
        let fetchRequest: NSFetchRequest<SplitwiseEntity> = SplitwiseEntity.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "deudor == %@", deudor.deudor ?? "")
        
        if let result = try? persistentContainer.viewContext.fetch(fetchRequest){
            
            let objectToUpdate = result[0]
            objectToUpdate.montoColones = deudor.montoColones
            objectToUpdate.montoDolares = deudor.montoDolares
            
            if (try? persistentContainer.viewContext.save()) != nil{
                print("Success to update")
            }else{
                print("Failed to update")
            }
        }
       
        
        
    }
    
    func getAllContacts() -> [SplitwiseEntity] {
        let fetchRequest: NSFetchRequest<SplitwiseEntity> = SplitwiseEntity.fetchRequest()
        
        if let result = try? persistentContainer.viewContext.fetch(fetchRequest){
            print("Success to retrieve all contacts")
            return result
        }
        print("Failed to retrieve all contacts")
        return []

    }
//
//    func deleteTask(task: TaskEntity){
//        // Mark for deletion
//        persistentContainer.viewContext.delete(task)
//
//        if let result = try? persistentContainer.viewContext.save(){
//            print("Success to delete task")
//        }else{
//            persistentContainer.viewContext.rollback()
//            print("Failed to delete task")
//        }
//
//    }
    
    
}
