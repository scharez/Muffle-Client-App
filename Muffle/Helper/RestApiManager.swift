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
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
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
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzY2hhcmV6IiwiaWF0IjoxNTU4MDc2MzQwLCJleHAiOjE1NTgxNzYzNDAsInJvbGUiOiJNVUZGTEVSIn0.yittRo9MWfYgTbp2oo1eywpFfCy7WD2KIEKQk1iJMig", forHTTPHeaderField: "Authorization")
        
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
