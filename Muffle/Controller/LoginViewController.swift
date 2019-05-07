//
//  LoginViewController.swift
//  Muffle
//
//  Created by Stefan Scharinger on 03.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        startUp();
    }

    
    @IBOutlet weak var tab: UISegmentedControl!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var isRegister: Bool = false;
    let ram = RestApiManager();
    
    
    func startUp() {
        
    }
    

    @IBAction func changeTab(_ sender: Any) {
        if (!isRegister) {
            isRegister = true;
        }
    }
    
    @IBAction func login(_ sender: Any) {
        
        let user = User();
        
        user.username = usernameField.text!;
        user.password = passwordField.text!;
        
        ram.login(user: user)
        print(usernameField.text! + " " + passwordField.text!)
    }
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
