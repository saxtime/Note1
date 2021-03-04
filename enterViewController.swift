//
//  enterViewController.swift
//  Note1
//
//  Created by Андрей Василевский on 2/5/21.
//

import UIKit

class enterViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var logIn: UIButton!
    @IBOutlet var registration: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

        imageView.image = UIImage(named: "home")
        imageView.contentMode = .scaleAspectFill
        
        logIn.layer.cornerRadius = logIn.frame.height / 2
        registration.layer.cornerRadius = registration.frame.height / 2
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
    }
    
   

}
