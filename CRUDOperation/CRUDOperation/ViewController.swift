
import UIKit

class ViewController: UIViewController {
    
    private var empArray = [Employee]()

    private let myTableView = UITableView()
    private let toolbar:UIToolbar = {
        let toolbar = UIToolbar()
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        toolbar.items = [space,add]
        return toolbar
    }()
    @objc func handleAdd(){
        print("Add Button Called")
        let vc = SecondController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        empArray = SQLiteHandler.shared.fetch()
        
        myTableView.reloadData()
       
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        //let temp = SQLiteHandler.shared
        
        
        setupTableView()
        view.addSubview(toolbar)
        view.addSubview(myTableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolbarHGeight:CGFloat = view.safeAreaInsets.top + 20.0
        toolbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height:toolbarHGeight)
        myTableView.frame = CGRect(x: 0, y: toolbar.bottom, width:view.frame.size.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
}

extension ViewController :UITableViewDataSource,UITableViewDelegate {
    private func setupTableView()
    {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Statecell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Statecell", for: indexPath)
        let emp = empArray[indexPath.row]
        cell.textLabel?.text = "\(emp.name) \t | \t \(emp.age) \t | \t \(emp.phone)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        let vc = SecondController()
        vc.employee = empArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      
        let id = empArray[indexPath.row].id
        
        SQLiteHandler.shared.delete(for: id) { success in
            
            if success {
                self.empArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                print("Unable to Delete from View Controller.")
            }
        }
    }
}
