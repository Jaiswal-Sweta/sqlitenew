import UIKit

class LoginViewController: UIViewController {

    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = """
        Student
        Admission
        System
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
    
    private let SubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Manage the Student Information"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .brown
        return label
    }()
    
    private let PasswordTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
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
    
    private let UsernameTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.text = ""
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let LoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(OnLoginClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.brown.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "login_bg")!)
        
        view.addSubview(TitleLabel)
        view.addSubview(SubTitleLabel)
        view.addSubview(UsernameTextfield)
        view.addSubview(PasswordTextfield)
        view.addSubview(LoginButton)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TitleLabel.frame = CGRect(x: 10, y: 80, width: view.frame.size.width, height: 150)
        SubTitleLabel.frame = CGRect(x: 10, y: 200, width: view.frame.size.width, height: 70)
        UsernameTextfield.frame = CGRect(x: 80, y: 350, width: view.frame.size.width-150, height: 35)
        PasswordTextfield.frame = CGRect(x: 80, y: 390, width: view.frame.size.width-150, height: 35)
        LoginButton.frame = CGRect(x: 80, y: 433, width: view.frame.size.width-150, height: 35)
    }
    
    @objc func OnLoginClicked()
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
