//
//  RestApiManager.swift
//  Muffle
//
//  Created by Stefan Scharinger on 03.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class RestApiManager: NSObject {
    
    //normal requests!
    var token : String = "";
    
    func login(user: User) {
        
        let Url = String(format: "http://localhost:8080/rest/muffle/login")
        guard let serviceUrl = URL(string: Url) else { return }
        
        let param = ["username" : user.username, "password" : user.password]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options:[]) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in

            if let data = data {
                do {
                    print(data)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
        
        
        
    }
    
    func register(user: User)  {
        
        let Url = String(format: "http://localhost:8080/rest/muffle/register")
        guard let serviceUrl = URL(string: Url) else { return }
        
        let param = ["username" : user.username, "password" : user.password, "email" : user.email]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Authorization", forHTTPHeaderField: "")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    print(json)
                    if let isItCorrect = json!["typ"] as? String {
                        if (isItCorrect == "success" ){
                            self.token = (json!["content"] as? String)!
                        }
                    }
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    //requests with webtokens!
    
    
    func test() {
        
        let Url = String(format: "http://localhost:8080/rest/muffle/test")
        guard let serviceUrl = URL(string: Url) else { return }
        
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    func getPlaylist(user: User)  {
        
        let Url = String(format: "http://localhost:8080/rest/muffle/getPlaylist")
        guard let serviceUrl = URL(string: Url) else { return }
        
        let param = ["" : ""]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
         request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    func createPlaylist()  {
        
        let Url = String(format: "http://localhost:8080/rest/muffle/createPlaylist")
        guard let serviceUrl = URL(string: Url) else { return }
        
        let param = ["name" : "Maschine"]
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    
}
