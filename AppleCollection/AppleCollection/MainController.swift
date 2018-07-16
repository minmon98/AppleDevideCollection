//
//  ViewController.swift
//  AppleCollection
//
//  Created by Minh Mon on 7/16/18.
//  Copyright © 2018 Minh Mon. All rights reserved.
//

import UIKit

class MainController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // Controls 
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // Variables
    
    var images = ["iPhone.png", "iPad.png", "Macbook.png"]
    var list = ["iPhone", "iPad", "Macbook"]
    var category = -1
    
    // Main function 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Support functions
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
        
        cell.lblType.text = list[indexPath.row]
        cell.imgType.image = UIImage.init(named: images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.category = indexPath.row
        
        performSegue(withIdentifier: "segueAToB", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueAToB") {
            let destination = segue.destination as! ProductList
            
            destination.category = self.category
        }
    }

}

