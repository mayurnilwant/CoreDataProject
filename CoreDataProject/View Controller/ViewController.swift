//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Mayur Nilwant on 03/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createEmployee()
        self.fetchEmployee()
        // Do any additional setup after loading the view.
    }

    private func createEmployee() {
        
        let emp = CDEmployee(context: PersistentStorage.sharedInstance.context)
        emp.name = "Mayur";
        emp.email = "mayur@gmail.com"
        emp.department = "Sales"
        PersistentStorage.sharedInstance.saveContext()
    }
    
    private func fetchEmployee()  {
        
        do {
            
            guard let results = try PersistentStorage.sharedInstance.context.fetch(CDEmployee.fetchRequest()) as? [CDEmployee] else {
                return
            }
            
            results.forEach { emp in
                print("Name : \(String(describing: emp.name)) and Department : \(emp.description) andEmail :\(String(describing: emp.email))")
            }
            
        }catch let error  {
            
            print(error)
            
        }
    }
}

