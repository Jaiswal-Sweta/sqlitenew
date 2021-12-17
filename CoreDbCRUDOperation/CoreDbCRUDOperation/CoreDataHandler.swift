//
//  CoreDataHandler.swift
//  CoreDbCRUDOperation
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler {
    
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext: NSManagedObjectContext?
    
    private init()
    {
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save() {
        appDelegate.saveContext()
    }
    
    func insert(name: String, age:Int, phone:String, completion: @escaping () -> Void) {
        let emp = Employee(context: managedObjectContext!)
        
        emp.name = name
        emp.age = Int64(age)
        emp.phone = phone
        
        save()
        completion()
    }
    
    func update(emp:Employee,name: String, age:Int, phone:String, completion: @escaping () -> Void){
        
        emp.name = name
        emp.age = Int64(age)
        emp.phone = phone
        
        save()
        completion()
    }
    
    func delete(emp:Employee, completion: @escaping () -> Void){
        
        managedObjectContext!.delete(emp)
        save()
        completion()
    }
    
    func fetch() -> [Employee] {
        
        
        let fetchRequest:NSFetchRequest<Employee> = Employee.fetchRequest()

        do{
            let empArray = try managedObjectContext?.fetch(fetchRequest)
            return empArray!
        } catch {
            print(error)
            return [Employee]()
        }
    }
    
}
