//
//  ViewController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 18/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//                //путь запроса
//                //let url = URL(string: "https://accounts.spotify.com/api/token")
//        
//                //обьект запроса
//                var request = URLRequest(url: url!)
//        
//                //методы запроса
//                request.httpMethod = "POST"
//        
//                //хэдеры запроса, подробные настройки к запросу
//                request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//                let bodyString = "grant_type=client_credentials&client_id=723b9f00076e4f608b07780752705b50&client_secret=97456e7ba54b41d99d51b17e733f23f7"
//                request.httpBody = bodyString.data(using: .utf8)
//        
//                URLSession.shared.dataTask(with: request) { data, response, error in
//                    guard let data = data, error == nil else {
//                        print(error?.localizedDescription)
//                        return
//                    }
//                    let responseData = try? JSONSerialization.jsonObject(with: data, options: [])
//                    print(responseData as! [String: Any])
//                }.resume()
        getTracks()
    }
    
    func getTracks() {
        //путь запроса
        let url = URL(string: "https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n/tracks")
        
        //обьект запроса
        var request = URLRequest(url: url!)
        
        //методы запроса
        request.httpMethod = "GET"
        
        //хэдеры запроса, подробные настройки к запросу
        request.setValue("Bearer BQA7-a2PpyadCbxGYPigm4RHaxqSfBP-tIFS84xd2U6721ABD3RKl5R38TEIflGxC2WZbLiNs5LarRaPC9iOSv08D60mZK2c9NO2xgYYYXCXV_OOs0U", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription)
                return
            }
            let responseData = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseData as! [String: Any])
        }.resume()
    }
}

