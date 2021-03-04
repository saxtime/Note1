//
//  SecondViewController.swift
//  Note1
//
//  Created by Андрей Василевский on 1/26/21.
//

import UIKit
import RealmSwift

class Type: Object {
    @objc dynamic var describing: String = ""
    //let parentCategory = LinkingObjects
}

class SecondViewController: UIViewController {
    
    let realm = try! Realm()
    
    var recievedString: String!
        
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = recievedString
        
    }
    

}
