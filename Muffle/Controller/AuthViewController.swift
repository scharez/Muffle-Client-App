//
//  LoginViewController.swift
//  Muffle
//
//  Created by Stefan Scharinger on 03.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        startUp();
    }

    
    @IBOutlet weak var tab: UISegmentedControl!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var retypePasswordField: UITextField!
    @IBOutlet weak var button: UIButton!
   
    var isRegister: Bool = false;
    let ram = RestApiManager();
    
    
    func startUp() {
        
        usernameField.keyboardAppearance = .dark;
        passwordField.keyboardAppearance = .dark;
        emailField.keyboardAppearance = .dark;
        retypePasswordField.keyboardAppearance = .dark;
        button.tintColor = UIColor.orange;
        tab.tintColor = UIColor.orange;
        
        if(!isRegister) {
            retypePasswordField.isHidden = true;
            emailField.isHidden = true;
        }
    }
    

    @IBAction func changeTab(_ sender: Any) {
        if (!isRegister) {
            isRegister = true;
            retypePasswordField.isHidden = false;
            emailField.isHidden = false;
            button.setTitle("Register", for: .normal);
        } else {
            isRegister = false;
            retypePasswordField.isHidden = true;
            emailField.isHidden = true;
            button.setTitle("Login", for: .normal);
        }
    }
    
    
    @IBAction func performRequest(_ sender: Any) {
        
        if(!isRegister) {
            let login = User();
            
            login.username = usernameField.text!;
            login.password = passwordField.text!;
            
            ram.login(user: login)
            print(usernameField.text! + " " + passwordField.text!)
        } else {
            
            let register = User();
            
            register.username = usernameField.text!;
            register.password = passwordField.text!;
            register.email = emailField.text!;
            
            ram.register(user: register)
            print(usernameField.text! + " " + passwordField.text! + " " + emailField.text!)
            
        }
        
      
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
