//
//  StudentDashboardViewController.swift
//  Assignment11
//
//  Created by DCS on 16/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentDashboardViewController: UIViewController {
    
    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Admin Dashboard"
        label.textColor = .brown
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .black
        return label
    }()
    
    private let StudentInfoLabel : UILabel = {
        let label = UILabel()
        label.text = "Student Information"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .white
        return label
    }()

    private let StudentInfoImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "student_dp")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.black.cgColor
        imgview.layer.borderWidth = 5
        imgview.tintColor = .white
        
        
        return imgview
    }()
    
    

    private let NoticeBoardImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "student_noticeboard")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.black.cgColor
        imgview.layer.borderWidth = 5
        imgview.tintColor = .white
        return imgview
    }()
    
    private let NoticeBoardLabel : UILabel = {
        let label = UILabel()
        label.text = "NoticeBoard"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "student_bg")!)
        
        view.addSubview(TitleLabel)
        view.addSubview(StudentInfoLabel)
        view.addSubview(StudentInfoImageView)
        view.addSubview(NoticeBoardImageView)
        view.addSubview(NoticeBoardLabel)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetectedOnStudent))
        StudentInfoImageView.isUserInteractionEnabled = true
        StudentInfoImageView.addGestureRecognizer(singleTap)
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(tapDetectedOnNotice))
        NoticeBoardImageView.isUserInteractionEnabled = true
        NoticeBoardImageView.addGestureRecognizer(singleTap1)

    }
    
    override func viewDidLayoutSubviews() {
        
         TitleLabel.frame = CGRect(x: 10, y: 70, width: view.frame.size.width, height: 50)
         StudentInfoLabel.frame = CGRect(x: (view.frame.size.width/2)-100, y: 120, width: 200, height: 50)
         StudentInfoImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 170, width: 200, height: 200)
        
         NoticeBoardImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 400, width: 200, height: 200)
         NoticeBoardLabel.frame = CGRect(x: (view.frame.size.width/2)-100, y: 520, width: 200, height: 200)
    }
    
    //Action
    @objc func tapDetectedOnStudent() {
        
        print("Imageview Student Clicked")
        let vc = StudentDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapDetectedOnNotice() {
        print("Imageview Notice Clicked")
        
        let vc = StudentViewNoticeBoardListViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
