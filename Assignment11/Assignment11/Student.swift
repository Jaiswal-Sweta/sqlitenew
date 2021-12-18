//
//  Student.swift
//  Assignment11
//
//  Created by DCS on 18/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation

class Student {
    
    var Spid : Int = 0
    var Name : String = ""
    var Gender : String = ""
    var Dob : String = ""
    var Class : String = ""
    var Password : String = ""
    var UserType : String = ""
    
    init(Spid: Int, Name: String, Gender: String, Dob: String, Class: String, Password: String, UserType: String)
    {
        self.Spid = Spid
        print("i==\(self.Spid)")
        self.Name = Name
        self.Gender = Gender
        self.Dob = Dob
        self.Class = Class
        self.Password = Password
        self.UserType = UserType
    }
}
