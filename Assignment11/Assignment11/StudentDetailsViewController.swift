//
//  StudentDetailsViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentDetailsViewController: UIViewController {

    private let SubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
    }()
    //Name
    private let NameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    private let NameTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    //Gender
    private let GenderLabel : UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let GenderSegment : UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "MALE", at: 1, animated: false)
        sg.insertSegment(withTitle: "FEMALE", at: 2, animated: false)
        sg.insertSegment(withTitle: "OTHER", at: 3, animated: false)
        sg.selectedSegmentIndex = 1
        sg.layer.borderColor = UIColor.black.cgColor
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        sg.tintColor = .black
        return sg
    }()
    
    //Birthdate
    private let BirthDateLabel : UILabel = {
        let label = UILabel()
        label.text = "BirthDate"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let BirthDatePicker : UIDatePicker = {
        let db = UIDatePicker()
        db.timeZone = NSTimeZone.local
        db.datePickerMode = UIDatePicker.Mode.date
        db.layer.borderWidth = 1
        db.layer.borderColor = UIColor.black.cgColor
        db.tintColor = .black
        db.backgroundColor = .white
        db.setValue(UIColor.black, forKey: "textColor")
        let date = Date()
        db.setDate(date, animated: false)
        return db
    }()
    
    //BirthCity
    private let ClassLabel : UILabel = {
        let label = UILabel()
        label.text = "Class"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let ClassTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let ChangePasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("Change the Password", for: .normal)
        button.addTarget(self, action: #selector(OnLoginClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.brown.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let ChangePasswordLabel : UILabel = {
        let label = UILabel()
        label.text = """
        If you Want to Chnage the Password
        Click Here
        """
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "student_bg")!)
        
        view.addSubview(SubTitleLabel)
        view.addSubview(NameLabel)
        view.addSubview(NameTextfield)
        
        view.addSubview(GenderLabel)
        view.addSubview(GenderSegment)
        
        view.addSubview(BirthDateLabel)
        view.addSubview(BirthDatePicker)
        
        view.addSubview(ClassLabel)
        view.addSubview(ClassTextfield)
        view.addSubview(ChangePasswordButton)
        view.addSubview(ChangePasswordLabel)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        SubTitleLabel.frame = CGRect(x: 10, y: 50, width: view.frame.size.width, height: 100)
        
        NameLabel.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        NameTextfield.frame = CGRect(x: 120, y: 150, width: 240, height: 30)
        
        GenderLabel.frame = CGRect(x: 10, y: 200, width: 100, height: 30)
        GenderSegment.frame = CGRect(x: 120, y: 200, width: 240, height: 30)
        
        BirthDateLabel.frame = CGRect(x: 10, y: 250, width: 100, height: 30)
        BirthDatePicker.frame = CGRect(x: 120, y: 250, width: 240, height: 40)
        
        ClassLabel.frame = CGRect(x: 10, y: 300, width: 100, height: 30)
        ClassTextfield.frame = CGRect(x: 120, y: 300, width: 240, height: 30)
        
        ChangePasswordLabel.frame = CGRect(x: 10, y: 450, width: view.frame.size.width, height: 100)
        ChangePasswordButton.frame = CGRect(x: 80, y: 530, width: view.frame.size.width-150, height: 35)
    }
    
    
    @objc func OnLoginClicked()
    {
        
        let n = StudentChangePasswordViewController()
        navigationController?.pushViewController(n, animated: true)
    }
    
}

