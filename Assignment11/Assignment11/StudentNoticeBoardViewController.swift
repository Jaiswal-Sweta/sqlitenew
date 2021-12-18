//
//  StudentNoticeBoardViewController.swift
//  Assignment11
//
//  Created by DCS on 17/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentNoticeBoardViewController: UIViewController {

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
        label.text = ""
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"student_bg")!)
        
        view.addSubview(SubTitleLabel)
        view.addSubview(NameLabel)
        view.addSubview(contentTextView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        SubTitleLabel.frame = CGRect(x: 10, y: 50, width: view.frame.size.width, height: 100)
        NameLabel.frame = CGRect(x: 10, y: 150, width: view.frame.size.width , height: 30)
        contentTextView.frame = CGRect(x: 10, y: 210, width: view.frame.size.width - 15, height: 400)
       
    }
}

