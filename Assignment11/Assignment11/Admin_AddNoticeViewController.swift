//
//  Admin_AddNoticeViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Admin_AddNoticeViewController: UIViewController {

    var Notes:String?
    
    private let SubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Notice Board"
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
    }()
    
    private let NameLabel : UILabel = {
        let label = UILabel()
        label.text = "File Name : "
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let nameTextField: UITextField = {
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
    
    //Birthdate
    private let DateLabel : UILabel = {
        let label = UILabel()
        label.text = "Date : "
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    private let DatePicker : UIDatePicker = {
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
    
    private let contentTextView : UITextView = {
        let TextView = UITextView()
        TextView.text = ""
        TextView.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        TextView.textAlignment = .left
        TextView.backgroundColor = .clear
        TextView.textColor = .black
        TextView.layer.borderWidth = 5
        TextView.layer.borderColor = UIColor.black.cgColor
        return TextView
    }()
    
    private let AddNoticeButton : UIButton = {
        let button = UIButton()
        button.setTitle("Save Notice", for: .normal)
        button.addTarget(self, action: #selector(OnAddNoticeClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.brown.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"student_bg")!)
        
        view.addSubview(SubTitleLabel)
        view.addSubview(NameLabel)
        view.addSubview(nameTextField)
        view.addSubview(DateLabel)
        view.addSubview(DatePicker)
        view.addSubview(contentTextView)
        view.addSubview(AddNoticeButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        SubTitleLabel.frame = CGRect(x: 10, y: 50, width: view.frame.size.width, height: 100)
        NameLabel.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        nameTextField.frame = CGRect(x: 120, y: 150, width: 240, height: 30)
        DateLabel.frame = CGRect(x: 15, y: 200, width: 100, height: 30)
        DatePicker.frame = CGRect(x: 120, y: 200, width: 240, height: 40)
        contentTextView.frame = CGRect(x: 10, y: 250, width: view.frame.size.width - 15, height: 300)
        AddNoticeButton.frame = CGRect(x: 70, y: 560, width: view.frame.size.width-150, height: 35)
        
    }
}


extension Admin_AddNoticeViewController {

    @objc func OnAddNoticeClicked()
    {
       print("Click on Add Notice Button")
    }
}
