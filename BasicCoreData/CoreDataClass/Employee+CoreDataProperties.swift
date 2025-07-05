//
//  Employee+CoreDataProperties.swift
//  BasicCoreData
//
//  Created by Rohit on 05/07/25.
//
//

import Foundation
import CoreData

extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: String?
    @NSManaged public var age: String?
    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
