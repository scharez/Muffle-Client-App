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
    @IBOutlet weak var retypePasswordField: UITextField!
    @IBOutlet weak var button: UIButton!
   
    var isRegister: Bool = false;
    let ram = RestApiManager();
    
    
    func startUp() {
        
        usernameField.keyboardAppearance = .dark;
        passwordField.keyboardAppearance = .dark;
        retypePasswordField.keyboardAppearance = .dark;
        button.tintColor = UIColor.orange;
        tab.tintColor = UIColor.orange;
        
        if(!isRegister) {
            retypePasswordField.isHidden = true;
        }
    }
    

    @IBAction func changeTab(_ sender: Any) {
        if (!isRegister) {
            isRegister = true;
            retypePasswordField.isHidden = false;
            button.setTitle("Register", for: .normal);
        } else {
            isRegister = false;
            retypePasswordField.isHidden = true;
            button.setTitle("Login", for: .normal);
        }
    }
    
    
    @IBAction func performRequest(_ sender: Any) {
        
        let user = User();
        
        user.username = usernameField.text!;
        user.password = passwordField.text!;
        
        ram.login(user: user)
        print(usernameField.text! + " " + passwordField.text!)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
