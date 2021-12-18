//
//  SQLiteHandler.swift
//  Assignment11
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteHandler {
    
    static let shared = SQLiteHandler()
    
    let dbPath = "Studentdb1.sqlite"
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
        CREATE TABLE IF NOT EXISTS Student(
        Spid INTEGER PRIMARY KEY,
        Name TEXT,
        Gender TEXT,
        Dob TEXT,
        Class TEXT,
        Password TEXT,
        Usertype TEXT);
        """
        
        //statement handle
        var createTableStatement:OpaquePointer? = nil
        
        //prepare Statement
        if sqlite3_prepare_v2(db, createTableString, -1 , &createTableStatement, nil) == SQLITE_OK {
            
            //Evaluate statement
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Student table created")
            } else {
                print("Student table could not be prepared")
            }
        }
        else
        {
            print("Student table could not be prepared")
        }
        
        //delete statement
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(s:Student, completion: @escaping ((Bool) -> Void)) {
        let insertStatementString = "INSERT INTO Student(Spid,Name, Gender, Dob, Class, Password, UserType) VALUES(?,?, ?, ?, ?, ?, ?);"
        
        var insertStatement:OpaquePointer? = nil
        
        //prepare insertStatement
        if sqlite3_prepare_v2(db, insertStatementString, -1 ,&insertStatement, nil) == SQLITE_OK {
            
            //Binding data
            sqlite3_bind_int(insertStatement, 1, Int32(s.Spid))
            sqlite3_bind_text(insertStatement, 2, (s.Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (s.Gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (s.Dob as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (s.Class as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (s.Password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, (s.UserType as NSString).utf8String, -1, nil)
          
            
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
  
    func update(s:Student, completion: @escaping ((Bool) -> Void)) {
        let updateStatementString = "UPDATE Student SET Name = ?, Gender = ?, Dob = ?, Class = ? WHERE Spid = ?;"
        
        var updateStatement:OpaquePointer? = nil
        
        //prepare updateStatement
        if sqlite3_prepare_v2(db, updateStatementString, -1 ,&updateStatement, nil) == SQLITE_OK {
            
            //Binding data
            sqlite3_bind_text(updateStatement, 1, (s.Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (s.Gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (s.Dob as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (s.Class as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 5, Int32(s.Spid))
            
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
        let deleteStatementString = "DELETE FROM Student WHERE Spid = ?;"
        
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
    
    func fetch() -> [Student]{
        let fetchStatementString = "SELECT * FROM Student;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var s = [Student]()
        
        //prepare fetchStatement
        if sqlite3_prepare_v2(db, fetchStatementString, -1 ,&fetchStatement, nil) == SQLITE_OK {
            
            //Evaluate statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                print("fetchd row succesfully")
                let Spid = Int(sqlite3_column_int(fetchStatement, 0))
                let Name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let Gender = String(cString: sqlite3_column_text(fetchStatement, 2))
                let Dob = String(cString: sqlite3_column_text(fetchStatement, 3))
                let Class = String(cString: sqlite3_column_text(fetchStatement, 4))
                let Password = String(cString: sqlite3_column_text(fetchStatement, 5))
                let UserType = String(cString: sqlite3_column_text(fetchStatement, 6))
             
                s.append(Student(Spid: Spid, Name: Name, Gender: Gender, Dob: Dob, Class: Class, Password: Password, UserType: UserType))
                print("\(Spid) |  \(Name)  |  \(Gender)  |  \(Dob) | \(Class) | \(Password) | \(UserType)")
                
            }
        }
        else
        {
            print("fetch statement could not be prepared")
        }
    
        //delete fetchstatement
        sqlite3_finalize(fetchStatement)
        
        return s
    }
    
    //Fetch_Id
    func fetchid() -> Int{
        let fetchStatementString = "SELECT MAX(Spid) FROM Student;"
        
        var fetchStatement:OpaquePointer? = nil
        var id : Int = 0
        
        //prepare fetchStatement
        if sqlite3_prepare_v2(db, fetchStatementString, -1 ,&fetchStatement, nil) == SQLITE_OK {
            
            //Evaluate statement
            if sqlite3_step(fetchStatement) == SQLITE_ROW {
                print("fetchd id row succesfully")
                id = Int(sqlite3_column_int(fetchStatement, 0))
                print("Spid = \(id)")
                //return Spid
            }
            else
            {
               //return id
                print("id = \(id)")
            }
        }
        else
        {
            print("fetch id statement could not be prepared")
        }
        
        //delete fetchstatement
        sqlite3_finalize(fetchStatement)
        return id
    }
    
}

