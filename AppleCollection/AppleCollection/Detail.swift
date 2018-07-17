//
//  Detail.swift
//  AppleCollection
//
//  Created by Minh Mon on 7/17/18.
//  Copyright © 2018 Minh Mon. All rights reserved.
//

import UIKit

class Detail: UIViewController {
    
    // Controls
    
    var information: String = ""
    
    @IBOutlet weak var lblDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDescription.text = information
    
        let btnBack = UIBarButtonItem.init(title: "Back", style: .plain, target: self, action: #selector(backKey))
        self.navigationItem.setLeftBarButton(btnBack, animated: true)
        
        let btnHome = UIBarButtonItem.init(title: "Home", style: .plain, target: self, action: #selector(homeKey))
        self.navigationItem.setRightBarButton(btnHome, animated: true)
    }
    
    func backKey() {
        let yesAction = UIAlertAction.init(title: "Yes", style: .default) {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
        
        let noAction = UIAlertAction.init(title: "No", style: .default, handler: nil)
        let alert = UIAlertController.init(title: "Are you sure?", message: "Do you want to back", preferredStyle: .alert)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func homeKey() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
