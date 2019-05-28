//
//  ViewController.swift
//  MuffleShare
//
//  Created by Stefan Scharinger on 23.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        
        backView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        backView.addSubview(mainView)
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        mainView.layer.cornerRadius = 8

    }
    
    @IBAction func addSong(_ sender: Any) {
        print("Add Song button presed")
    }
    
    
    @IBAction func cancelPopUp(_ sender: Any) {
        print("Cancel Button presed")
        dismiss(animated: true) {
            print("close Popup")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
