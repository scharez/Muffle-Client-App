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
            ram.test()
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
            
            
            
            ram.login(user: login) // Return wert, was von Server Kommt
            print(usernameField.text! + " " + passwordField.text!)
        } else {
            
            let register = User();
            
            register.username = usernameField.text!;
            register.password = passwordField.text!;
            register.email = emailField.text!;
            
            let alert = UIAlertController(title: "LOL", message: "Mega Uff", preferredStyle: .alert)
            
            //alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            let ok = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                self.isRegister = false;
                self.retypePasswordField.isHidden = true;
                self.emailField.isHidden = true;
                self.button.setTitle("Login", for: .normal);
                self.tab.selectedSegmentIndex = 0
            }
            
            alert.addAction(ok)
            
            self.present(alert, animated: true)
            
            ram.register(user: register)
            print(usernameField.text! + " " + passwordField.text! + " " + emailField.text!)
            
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
         if let destVC = segue.destination as? ViewWinController {
         destVC.model = model
         
         performSegue(withIdentifier: "gotit", sender: self)
         }
        */
    }
}
