//
//  StudentChangePasswordViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentChangePasswordViewController: UIViewController {

    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = """
        Change
        Your
        Password
        """
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 40)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
    }()
    
    private let PasswordTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let CPasswordTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let ChangePasswordButton : UIButton = {
        let button = UIButton()
        button.setTitle("Change Password", for: .normal)
        button.addTarget(self, action: #selector(OnChangePasswordClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.brown.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "student_bg")!)
        
        view.addSubview(TitleLabel)
        view.addSubview(PasswordTextfield)
        view.addSubview(CPasswordTextfield)
        view.addSubview(ChangePasswordButton)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TitleLabel.frame = CGRect(x: 10, y: 80, width: view.frame.size.width, height: 150)
        PasswordTextfield.frame = CGRect(x: 80, y: 450, width: view.frame.size.width-150, height: 35)
        CPasswordTextfield.frame = CGRect(x: 80, y: 490, width: view.frame.size.width-150, height: 35)
        ChangePasswordButton.frame = CGRect(x: 80, y: 533, width: view.frame.size.width-150, height: 35)
    }
    
    @objc func OnChangePasswordClicked()
    {
        
        let n = StudentDashboardViewController()
        navigationController?.pushViewController(n, animated: true)
        
        //        if (UsernameTextfield.text == "Sweta" && PasswordTextfield.text == "Sweta")
        //        {
        //            let n = StudentDashboardViewController()
        //            navigationController?.pushViewController(n, animated: true)
        ////            present(n,animated: false)
        //        }
        //        else
        //        {
        //            let alert = UIAlertController(title: title, message: "Invalid Credentials", preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "Try Again", style: .cancel))
        //            DispatchQueue.main.async {
        //                self.present(alert,animated: true)
        //            }
        //        }
        
    }
    
}
