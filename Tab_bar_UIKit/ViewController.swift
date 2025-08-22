//
//  ViewController.swift
//  Tab_bar_UIKit
//
//  Created by Adilet Kistaubayev on 20.08.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addButton(_ sender: Any) {
        
        let task = textLabel.text!
        
        var newTask = TaskItem(name: task, isCompleted: false)
        
        
        do {
            if let data = UserDefaults.standard.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self,from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            } else {
                let encodedata = try  JSONDecoder().encode([newTask])
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
        } catch {
            print ("unable to encode \(error)")
        }
        
        /*
        
        if let data  = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
            var array = taskArray
            
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

