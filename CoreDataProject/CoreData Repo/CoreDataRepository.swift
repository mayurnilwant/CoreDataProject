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
    func update(employee record: CDEmployee)
    func create(employee: CDEmployee)
    func delete(record: CDEmployee)
    func getById(identifier id: UUID?) -> CDEmployee?
    
}


struct EmployeeDataRepository : EmployeeRepository {
    func getAll() -> [CDEmployee]? {
        
        let employee = PersistentStorage.sharedInstance.getAllRecords(managedObjType: CDEmployee.self)
        return employee
    }
    
    func update(employee record: CDEmployee){
         
        let employee = self.getById(identifier: record.identifier)
        
        guard employee != nil else {
            return
        }
        employee?.name = "Changed name"
        employee?.email = "changedEmail"
        employee?.department = "ChangedDepartment"
        

    }
    
    func create(employee: CDEmployee) {
        
        PersistentStorage.sharedInstance.saveContext()
    
        
    }
    
    func delete(record: CDEmployee) {
        
        guard let empObj = self.getById(identifier: record.identifier) else {
            return
        }
        PersistentStorage.sharedInstance.context.delete(empObj)
        
    }
    
    func getById(identifier id: UUID?) -> CDEmployee? {
        
        let fetchReq = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let empIdPredicate = NSPredicate(format: "id == %@",id! as CVarArg)
        fetchReq.predicate = empIdPredicate
        return try? PersistentStorage.sharedInstance.context.fetch(fetchReq).first
        
    }
    
}


