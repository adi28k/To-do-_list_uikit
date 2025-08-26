//
//  ViewController.swift
//  Tab_bar_UIKit
//
//  Created by Adilet Kistaubayev on 20.08.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet var surnameTextField: [UITextField]!
    
    
    @IBOutlet var phoneTextField: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty,
                 let surname = surnameTextField.text, !surname.isEmpty,
                 let phone = phoneTextField.text, !phone.isEmpty else {
               return 
           }
        
        
        do {
            if let data = UserDefaults.standard.data(forKey: "taskItemArray"){
                
                var array = try JSONDecoder().decode([TaskItem].self,from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            } else {
                let encodedata = try  JSONEncoder().encode([newTask])
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
        } catch {
            print ("unable to encode \(error)")
        }
        
        /*
        
        if let data  = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
            var array = taskArray
            fdgdfgfdgdfgdfg
            array.append(task)
            
            UserDefaults.standard.setValue(array, forKey: "taskArray")
        }
        else {
            UserDefaults.standard.setValue([task], forKey: "taskArray")
        }
        
        */
        
        textLabel.text = ""
    }
    
    

}

