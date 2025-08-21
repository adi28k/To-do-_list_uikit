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
        
        if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
            var array = taskArray
            
            array.append(task)
            
            UserDefaults.standard.setValue(array, forKey: "taskArray")
        }
        else {
            UserDefaults.standard.setValue([task], forKey: "taskArray")
        }
        
        textLabel.text = ""
    }
    
    

}

