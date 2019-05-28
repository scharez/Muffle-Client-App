//
//  PlaylistViewController.swift
//  Muffle
//
//  Created by Maria Mihae on 19.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    var playlist:[String] = ["Pop","Punk"]
    var segueIdentifies = ["first"]
    let ram = RestApiManager();
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPlaylist")!
        cell.textLabel?.text = playlist[indexPath.row]
        return cell
    }
    
    @IBAction func createPlaylist(_ sender: UIButton) {
        ram.createPlaylist();
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: segueIdentifies[indexPath.row], sender: self)
    }
    
   /* func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
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
