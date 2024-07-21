//
//  RegisterSignInController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 21/7/24.
//

import UIKit

class RegisterSignInController: UIViewController {

    private lazy var billieImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "billie")
        return view
    }()
    
    private lazy var leftBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "leftBtn"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 36/2
        view.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var spotifyImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spotify")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Enjoy listening to music"
        view.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Spotify is a proprietary Swedish audio streaming and media services provider "
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.textColor = .systemGray
        view.numberOfLines = 3
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        return view
    }()
    
    private lazy var registerBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Register", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 66/255, green: 200/255, blue: 60/255, alpha: 1.0)
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addTarget(self, action: #selector(registerBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var signInBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .white
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    @objc func registerBtnTapped() {
        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signInBtnTapped() {
        
    }
    
    @objc func leftBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        view.addSubview(billieImage)
        billieImage.translatesAutoresizingMaskIntoConstraints = false
        billieImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150).isActive = true
        billieImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -180).isActive = true
        
        view.addSubview(leftBtn)
        leftBtn.translatesAutoresizingMaskIntoConstraints = false
        leftBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        leftBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        leftBtn.heightAnchor.constraint(equalToConstant: 36).isActive = true
        leftBtn.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(spotifyImage)
        spotifyImage.translatesAutoresizingMaskIntoConstraints = false
        spotifyImage.topAnchor.constraint(equalTo: leftBtn.bottomAnchor, constant: 100).isActive = true
        spotifyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spotifyImage.heightAnchor.constraint(equalToConstant: 71).isActive = true
        spotifyImage.widthAnchor.constraint(equalToConstant: 235).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: spotifyImage.bottomAnchor, constant: 55).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        view.addSubview(registerBtn)
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15).isActive = true
        registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        registerBtn.heightAnchor.constraint(equalToConstant: 73).isActive = true
        registerBtn.widthAnchor.constraint(equalToConstant: 147).isActive = true
        
        view.addSubview(signInBtn)
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15).isActive = true
        signInBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 73).isActive = true
        signInBtn.widthAnchor.constraint(equalToConstant: 147).isActive = true
    }
}
