//
//  CoreDataService.swift
//  BasicCoreData
//
//  Created by Rohit on 05/07/25.
//

import Foundation
import UIKit
import CoreData

class CoreDataService{
    static let instance = CoreDataService()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveEmployee(id:String,name:String,age:String){
        let newEmployee = Employee(context: context)
        newEmployee.age = age
        newEmployee.id = id
        newEmployee.name = name
        saveContext()
    }
    
    func fetchEmployee() -> [Employee]{
        let request:NSFetchRequest<Employee> = Employee.fetchRequest()
        do {
            return try context.fetch(request)
        }catch{
            print("Fetching Error \(error)")
            return []
        }
    }
    func deleteEmployee(_ emp: Employee){
            context.delete(emp)
            saveContext()
    }
    private func saveContext(){
        do {
            try context.save()
        }catch{
            print("Error \(error)")
        }
    }

}
