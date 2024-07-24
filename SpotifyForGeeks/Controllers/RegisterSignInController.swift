//  RegisterSignInController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 21/7/24.
//

import UIKit
import SnapKit

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
        billieImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(-180)
        }
        
        view.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(25)
            make.height.width.equalTo(36)
        }
        
        view.addSubview(spotifyImage)
        spotifyImage.snp.makeConstraints { make in
            make.top.equalTo(leftBtn.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(71)
            make.width.equalTo(235)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(spotifyImage.snp.bottom).offset(55)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        view.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(25)
            make.height.equalTo(73)
            make.width.equalTo(147)
        }
        
        view.addSubview(signInBtn)
        signInBtn.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(73)
            make.width.equalTo(147)
        }
    }
}
