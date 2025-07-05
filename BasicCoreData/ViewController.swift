//
//  ViewController.swift
//  BasicCoreData
//
//  Created by Rohit on 05/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var employeList:[Employee] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        loadData()
    }
    func loadData(){
        employeList = CoreDataService.instance.fetchEmployee()
        tableView.reloadData()
    }
    @IBAction func savebtn(_ sender: UIButton){
                let randomId = UUID().uuidString
                let randomAge = String(Int.random(in: 20...40))
                let name = "Employee \(employeList.count + 1)"
                
                CoreDataService.instance.saveEmployee(id: randomId, name: name, age: randomAge)
                loadData()
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.lbl1.text = "\(String(describing: employeList[indexPath.row].name)) \(employeList[indexPath.row].age ?? "") \(String(describing: employeList[indexPath.row].id))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let employee = employeList[indexPath.row]
                CoreDataService.instance.deleteEmployee(employee)
                loadData()
            }
        }
}

