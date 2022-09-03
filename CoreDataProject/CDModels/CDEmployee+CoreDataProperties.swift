//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Mayur Nilwant on 03/09/2022.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var department: String?
    @NSManaged public var email: String?
    @NSManaged public var identifier: UUID?
    @NSManaged public var name: String?

}

extension CDEmployee : Identifiable {

}
