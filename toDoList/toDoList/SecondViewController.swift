//
//  SecondViewController.swift
//  toDoList
//
//  Created by Wilson on 2017-02-05.
//  Copyright © 2017 com.Wilson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField ) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        var items:[String] = []
        
        let itemObject = UserDefaults.standard.object(forKey: "list")
        
        if  itemField.text != "" {
            
            if let tempItems = itemObject as? [String] {
                
                items = tempItems
                items.append(itemField.text!)
                UserDefaults.standard.set(items, forKey: "list")
            } else {
                
                items = [itemField.text!]
                UserDefaults.standard.set(items, forKey: "list")
            }
            
            messageLabel.text = "Please enter an item"
        }
        
        itemField.text = ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

