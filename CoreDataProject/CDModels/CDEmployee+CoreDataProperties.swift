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

    @NSManaged public var name: String?
    @NSManaged public var department: String?
    @NSManaged public var email: String?

}

extension CDEmployee : Identifiable {

}
