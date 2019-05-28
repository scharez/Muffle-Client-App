//
//  PopUpVC.swift
//  Muffle
//
//  Created by Maria Mihae on 27.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {


    @IBOutlet weak var popUpView: UIView!
    var playlist:[String] = ["Pop","Punk"]
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius=10
        popUpView.layer.masksToBounds=true
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var plName: UITextField!
    
  
    @IBAction func addPlayList(_ sender: UIButton) {
        playlist.append(plName.text!)
        
    }
    
    @IBAction func closeWindows(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest=segue.destination as! PlaylistViewController
        dest.playlist=playlist
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
