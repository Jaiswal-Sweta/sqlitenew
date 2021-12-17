
import UIKit

class SecondController: UIViewController {
    var employee:Employee?
    let temp = SQLiteHandler.shared
    
    public let nameTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    public let ageTextField2:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    public let phoneTextField3:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.backgroundColor = .gray
        textField.textAlignment = .left
        return textField
    }()
    private let MyButton:UIButton={
        let button=UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(OnInsertButtonClick), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func OnInsertButtonClick()
    {
        let name = nameTextField1.text!
        let age = Int(ageTextField2.text!)!
        let phone = phoneTextField3.text!
        
        if let emp = employee {
            MyButton.setTitle("Update", for: .normal)
            let updatedEmp = Employee(id: emp.id, name: name, age: Int(age), phone: phone)
            print("Update \(updatedEmp)")
            update(emp: updatedEmp)
            
        }else {
            let Emp = Employee(id: 1,name: name, age: age,phone: phone)
            print("INSERT \(name), \(age) ,\(phone)")
            insert(emp: Emp)
            
        }
    }
    private func insert(emp: Employee){
        
        SQLiteHandler.shared.insert(emp: emp) { [weak self] (success) in
            if success {
                print("Success : Insert successfull, received message at View Controller ")
                self?.resetFields()
            } else {
                print("Failure: Insert failed, received message at View Controller ")
            }
        }
    }

    private func update(emp: Employee){
        SQLiteHandler.shared.update(emp: emp) { [weak self] (success) in
            if success {
                print("Success : Update successfull, received message at View Controller ")
                 self?.resetFields()
            } else {
                print("Failure: Update failed, received message at View Controller ")
            }
        }
    }
    
    private func resetFields() {
        employee = nil
        nameTextField1.text = ""
        ageTextField2.text = ""
        phoneTextField3.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameTextField1)
        view.addSubview(ageTextField2)
        view.addSubview(phoneTextField3)
        view.addSubview(MyButton)
        
        if let emp = employee {
            nameTextField1.text = emp.name
            ageTextField2.text = String(emp.age)
            phoneTextField3.text = emp.phone
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField1.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.width - 40, height: 40)
        ageTextField2.frame = CGRect(x: 20, y:nameTextField1.bottom + 10, width: view.width - 40, height: 40)
        phoneTextField3.frame = CGRect(x: 20, y: ageTextField2.bottom + 10, width: view.width - 40, height: 40)
        MyButton.frame = CGRect(x: 20, y: phoneTextField3.bottom + 10, width: view.width - 40, height: 40)
    }
}
