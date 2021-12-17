//
//  NewEmployeeVC.swift
//  MyCoreDataApp
//
//  Created by RG on 16/12/21.
//

import UIKit

class NewEmployeeVC: UIViewController {
    
    var employee:Employee?
    
    private let nameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full Name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let ageTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Age"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let phoneTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let saveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveEmpData), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(phoneTextField)
        view.addSubview(saveButton)
        
        if let emp = employee {
            nameTextField.text = emp.name
            ageTextField.text = String(emp.age)
            phoneTextField.text = emp.phone
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        nameTextField.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        ageTextField.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        phoneTextField.frame = CGRect(x: 40, y: ageTextField.bottom + 20, width: view.width - 80, height: 40)
        saveButton.frame = CGRect(x: 40, y: phoneTextField.bottom + 20, width: view.width - 80, height: 40)
    }
    
    @objc private func saveEmpData() {
        
        let name = nameTextField.text!
        let age = Int(ageTextField.text!)!
        let phone = phoneTextField.text!
        
        if let emp = employee {
            // UPDATE
            
            CoreDataHandler.shared.update(emp: emp, name: name, age: age, phone: phone) {
                print(" Data Updated")
                self.reset()
            }
        }
        else
        {
            // INSERT
            CoreDataHandler.shared.insert(name: name, age: age, phone: phone) {
                 print("Data Inserted")
                 self.reset()
            }
            
        }
    }
    
    
    private func reset() {
        employee = nil
        nameTextField.text = ""
        ageTextField.text = ""
        phoneTextField.text = ""
    }
    
}
