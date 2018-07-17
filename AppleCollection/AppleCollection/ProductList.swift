//
//  ProductList.swift
//  AppleCollection
//
//  Created by Minh Mon on 7/16/18.
//  Copyright © 2018 Minh Mon. All rights reserved.
//

import UIKit

class ProductList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Controls 
    @IBOutlet weak var tableView: UITableView!
    
    var category = -1
    
    var products = [
        ["iPhone SE", "iPhone 6s", "iPhone 7", "iPhone 8", "iPhone X"],
        ["iPad Mini 4", "iPad", "iPad Pro"],
        ["Macbook Pro", "Macbook Air", "Macbook"]
    ]
    
    var descriptions = [
        ["A big step for small", "We’ll work with your carrier to activate your new iPhone so you can keep your existing number and rate plan", "We’ll work with your current carrier to activate your new iPhone so you can keep your existing number and rate plan", "A beautiful mind", "Say hello to the future"],
        ["Mighty. Small", "Like a computer. Unlike any computer", "Anything you can do, you can do better"],
        ["More performance, More pro", "Make big things happen", "Light. Years ahead"]
        
    ]
    
    // Main function
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Support functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products[category].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productID", for: indexPath) as! ProductCell
        
        cell.lblName.text = products[category][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRow = indexPath.row
        performSegue(withIdentifier: "segueBToC", sender: self)
    }
    
    var selectRow = -1
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueBToC") {
            let destination = segue.destination as! Detail
            
            destination.information = descriptions[category][selectRow]
        }
    }
    
}
