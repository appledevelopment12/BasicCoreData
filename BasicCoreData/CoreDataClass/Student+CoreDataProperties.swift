//
//  Student+CoreDataProperties.swift
//  BasicCoreData
//
//  Created by Rohit on 05/07/25.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var sub: String?
    @NSManaged public var degree: String?

}

extension Student : Identifiable {

}
