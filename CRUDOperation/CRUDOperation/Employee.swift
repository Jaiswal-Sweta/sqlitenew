
import Foundation

class Employee {
    
    
    var id : Int = 0
    var name : String = ""
    var age : Int = 0
    var phone: String = ""
    
    init(id:Int, name:String ,age:Int, phone:String)
    {
        self.id = id
        self.name = name
        self.age = age
        self.phone = phone
    }
}
