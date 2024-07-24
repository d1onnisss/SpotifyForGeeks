//
//  TokenResponce.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 22/7/24.
//

import Foundation

struct TokenResponce: Codable {
    let expires_in: Int
    let token_type: String
    let access_token: String
}
