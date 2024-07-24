//
//  ViewController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 18/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkService.getTracks()
    }
}

