//
//  signUpViewController.swift
//  Note1
//
//  Created by Андрей Василевский on 2/5/21.
//

import UIKit
import FirebaseAuth

class signUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func registrationTapped(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                showCreateAccount(email: email, password: password)
                return
            }
            
            print("You have singed In")
        }
        
        func showCreateAccount(email: String, password: String) {
            let alert = UIAlertController(title: "Create account", message: "Create", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
                FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                    
                    
                  
                
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                
            }))
            present(alert, animated: true)
        }
        
    }
    
    

}
