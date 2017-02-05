//
//  FirstViewController.swift
//  toDoList
//
//  Created by Wilson on 2017-02-05.
//  Copyright © 2017 com.Wilson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [String]()
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if list.count == 0 {
            return 1
        } else {
            return list.count
        }
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "item")
        
        if list.count > 0 {
            cell.textLabel?.text = list[indexPath.row]
        } else {
            cell.textLabel?.text = "Try Adding things to your list"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let arrayObject = UserDefaults.standard.object(forKey: "list")
        if let initList = arrayObject as? [String] {
            list = initList
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

