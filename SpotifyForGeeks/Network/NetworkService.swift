//
//  NetworkService.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 22/7/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private let keychainService = KeychainService.shared
    
    func getAccessToken(completionHandler: @escaping (TokenResponce?) -> Void) {
        //путь запроса
        let url = URL(string: "https://accounts.spotify.com/api/token")
        
        //обьект запроса
        var request = URLRequest(url: url!)
        
        //методы запроса
        request.httpMethod = "POST"
        
        //хэдеры запроса, подробные настройки к запросу
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        //тело запроса
        let bodyString = "grant_type=client_credentials&client_id=723b9f00076e4f608b07780752705b50&client_secret=97456e7ba54b41d99d51b17e733f23f7"
        request.httpBody = bodyString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                completionHandler(nil)
                return
            }
            let decoder = JSONDecoder()
            let responseData = try? decoder.decode(TokenResponce.self, from: data)
            print(responseData!)
            completionHandler(responseData)
            
        }.resume()
    }
    
    func getTracks() {
        let url = URL(string: "https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n/tracks")
        
        //обьект запроса
        var request = URLRequest(url: url!)
        
        //методы запроса
        request.httpMethod = "GET"
        
        guard let token = keychainService.getAccessToken() else {
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token.access_token)", forHTTPHeaderField: "Authorization")
        
        var components = URLComponents(string: "https://accounts.spotify.com/v1/tracks")
        
        components?.queryItems = [
            URLQueryItem(name: "market", value: "ES"),
            URLQueryItem(name: "ids", value: "7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B")
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
            let responseData = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseData!)
        }.resume()
    }
}
