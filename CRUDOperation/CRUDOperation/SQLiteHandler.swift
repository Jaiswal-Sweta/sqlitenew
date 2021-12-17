//
//  SQLiteHandler.swift
//  CRUDOperation
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteHandler {
    
    static let shared = SQLiteHandler()
    
    let dbPath = "empdb.sqlite"
    var db:OpaquePointer?  //Database Pointer
    
    private init()
    {
        db=openDatabase()
        createTable()
    }
    
    func openDatabase() -> OpaquePointer? {
        let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = docURL.appendingPathComponent(dbPath)
        
        var database:OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &database) == SQLITE_OK {
            
            print("Opened Connection to the database successfully at : \(fileURL)")
            return database
        } else {
            print("error connecting to the database")
            return nil
        }
    }
    
    
    func createTable() {
        //Sql statement
        let createTableString = """
        CREATE TABLE IF NOT EXISTS emp(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER,
        phone TEXT);
        """
        
        //statement handle
        var createTableStatement:OpaquePointer? = nil
        
        //prepare Statement
        if sqlite3_prepare_v2(db, createTableString, -1 , &createTableStatement, nil) == SQLITE_OK {
            
            //Evaluate statement
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("emp table created")
            } else {
                print("emp table could not be prepared")
            }
        }
        else
        {
            print("emp table could not be prepared")
        }
        
        //delete statement
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(emp:Employee, completion: @escaping ((Bool) -> Void)) {
        let insertStatementString = "INSERT INTO emp(name, age, phone) VALUES(?, ?, ?);"
        
        var insertStatement:OpaquePointer? = nil
        
        //prepare insertStatement
        if sqlite3_prepare_v2(db, insertStatementString, -1 ,&insertStatement, nil) == SQLITE_OK {
            
            //Binding data
            sqlite3_bind_text(insertStatement, 1, (emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(emp.age))
            sqlite3_bind_text(insertStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
            
            //Evaluate statement
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("inserted row succesfully")
                completion(true)
            } else {
                print("could not insert row")
                completion(false)
            }
            
        }
        else
        {
            print("insert statement could not be prepared")
            completion(false)
        }
        
        //delete insertstatement
        sqlite3_finalize(insertStatement)
        
    }
    
    func update(emp:Employee, completion: @escaping ((Bool) -> Void)) {
        let updateStatementString = "UPDATE emp SET name = ?, age = ?, phone = ? WHERE id = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        //prepare updateStatement
        if sqlite3_prepare_v2(db, updateStatementString, -1 ,&updateStatement, nil) == SQLITE_OK {
            
            //Binding data
            sqlite3_bind_text(updateStatement, 1, (emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 2, Int32(emp.age))
            sqlite3_bind_text(updateStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
             sqlite3_bind_int(updateStatement, 4, Int32(emp.id))
            
            //Evaluate statement
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("updated row succesfully")
                completion(true)
            } else {
                print("could not update row")
                completion(false)
            }
            
        }
        else
        {
            print("UPDATE statement could not be prepared")
            completion(false)
        }
        
        //delete updatestatement
        sqlite3_finalize(updateStatement)
        
    }
    
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)) {
        let deleteStatementString = "DELETE FROM emp WHERE id = ?;"
        
        var deleteStatement:OpaquePointer? = nil
        
        //prepare deleteStatement
        if sqlite3_prepare_v2(db, deleteStatementString, -1 ,&deleteStatement, nil) == SQLITE_OK {
            
            //Binding data
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            
            //Evaluate statement
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("deleted row succesfully")
                completion(true)
            } else {
                print("could not delete row")
                completion(false)
            }
            
        }
        else
        {
            print("Delete statement could not be prepared")
            completion(false)
        }
        
        //delete deletestatement
        sqlite3_finalize(deleteStatement)
        
    }
    
    func fetch() -> [Employee]{
        let fetchStatementString = "SELECT * FROM emp;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var emp = [Employee]()
        
        //prepare fetchStatement
        if sqlite3_prepare_v2(db, fetchStatementString, -1 ,&fetchStatement, nil) == SQLITE_OK {
            
            //Evaluate statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                print("fetchd row succesfully")
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let age = Int(sqlite3_column_int(fetchStatement, 2))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 3))
                
                emp.append(Employee(id: id, name: name, age: age, phone: phone))
                print("\(id) |  \(name)  |  \(age)  |  \(phone)")
                
            }
        }
        else
        {
            print("fetch statement could not be prepared")
        }
        
        //delete fetchstatement
        sqlite3_finalize(fetchStatement)
        
        return emp
    }
    
}
