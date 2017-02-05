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
    
    var array = [String]()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField ) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        if let item = itemField.text {
            array.append(item)
            
            UserDefaults.standard.set(array, forKey: "list")
            
            messageLabel.text = ""
            
        } else {
            messageLabel.text = "Please enter an item before pressing add"
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let listObject = UserDefaults.standard.object(forKey: "list")
        
        if let list = listObject as? [String] {
            array = list
        } else {
            UserDefaults.standard.set(array, forKey: "list")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

