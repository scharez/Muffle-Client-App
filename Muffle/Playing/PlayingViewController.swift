//
//  PlayingViewController.swift
//  Muffle
//
//  Created by Maria Mihae on 20.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import UIKit
import AVFoundation
class PlayingViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var songName: UILabel!
    
    var songs:[String] = ["Sum 41 - Fatlip","My Chemical Romance - The Sharpest Lives","Punk"]
    var thisSong = 0
    var audioStuffed = false
    // var audioPlayer = AVAudioEngine()
    var audioPlayer: AVAudioPlayer!
    var curSong = -1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if(curSong == indexPath.row && audioPlayer.isPlaying == true){
            audioPlayer.stop()
        }else{
            let url = Bundle.main.url(forResource: songs[indexPath.row], withExtension: "mp3")
            curSong = indexPath.row
            songName.text=songs[indexPath.row]
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayer.prepareToPlay()
            } catch {
                print("Error:", error.localizedDescription)
            }
            audioPlayer.play()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gettingSongNames()
    }
    
    func gettingSongNames()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            //loop through the found urls
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
                
            }
            
            tableV.reloadData()
        }
        catch
        {
            print ("ERROR")
        }
    }
    
    
}

