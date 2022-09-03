//
//  CoreDataRepository.swift
//  CoreDataProject
//
//  Created by Mayur Nilwant on 03/09/2022.
//

import Foundation
import CoreData

protocol EmployeeRepository {
    
    func getAll() -> [CDEmployee]?
    func get(byIdentifier id: UUID) -> CDEmployee?
    func update(identifier id: UUID)
    func create(employee: CDEmployee)
    func delete(record: CDEmployee)
    
}


struct EmployeeDataRepository : EmployeeRepository {
    func getAll() -> [CDEmployee]? {
        
        let employee = PersistentStorage.sharedInstance.getAllRecords(managedObjType: CDEmployee.self)
        return employee
    }
    
    func get(byIdentifier id: UUID) -> CDEmployee? {
        return nil
    }
    
    func update(identifier id: UUID) {
        
    }
    
    func create(employee: CDEmployee) {
        
        PersistentStorage.sharedInstance.saveContext()
    
        
    }
    
    func delete(record: CDEmployee) {
        
    }
    
    
    
}


