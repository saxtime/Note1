//
//  loginViewController.swift
//  Note1
//
//  Created by Андрей Василевский on 2/5/21.
//

import UIKit
import Firebase

class loginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.isHidden = true
    }
    

    @IBAction func loginTapped(_ sender: UIButton) {
        
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                self?.label.isHidden = false
                self?.label.text = "Cannot enter"
                self?.label.textColor = .red
                return
            }
            
            self?.label.isHidden = true
            
            let viewController = self?.storyboard?.instantiateViewController(withIdentifier: "start")
            self?.navigationController?.pushViewController(viewController!, animated: true)
            
            print("You have singed In")
        }
    }
    

}
