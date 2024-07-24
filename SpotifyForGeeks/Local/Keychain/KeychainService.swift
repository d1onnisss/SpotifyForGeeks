//
//  Keychain.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 22/7/24.
//

import Foundation
import KeychainSwift

class KeychainService {
    static let shared = KeychainService()
    
    private let keychain = KeychainSwift()
    
    func setAccessToken(token: TokenResponce) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(token)
            keychain.set(data, forKey: "access_token")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getAccessToken() -> TokenResponce? {
        guard let accessToken = keychain.getData("access_token") else {
            return nil
        }
       
        let decoder = JSONDecoder()
        
        do {
            let data = try decoder.decode(TokenResponce.self, from: accessToken)
            return data
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
