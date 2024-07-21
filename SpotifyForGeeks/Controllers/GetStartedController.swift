//
//  GetStartedController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 20/7/24.
//

import UIKit

class GetStartedController: UIViewController {

    private lazy var arianaImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ariana")
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
        view.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam."
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.textColor = .systemGray
        view.numberOfLines = 4
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        return view
    }()
    
    private lazy var getStartedBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Get Started", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 66/255, green: 200/255, blue: 60/255, alpha: 1.0)
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addTarget(self, action: #selector(getStartedBtnTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc func getStartedBtnTapped() {
        let vc = ChooseModeController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraints() {
        view.addSubview(arianaImage)
        arianaImage.translatesAutoresizingMaskIntoConstraints = false
        arianaImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        arianaImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        arianaImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        arianaImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(spotifyImage)
        spotifyImage.translatesAutoresizingMaskIntoConstraints = false
        spotifyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        spotifyImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 97).isActive = true
        spotifyImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -97).isActive = true
        spotifyImage.heightAnchor.constraint(equalToConstant: 59).isActive = true
        spotifyImage.widthAnchor.constraint(equalToConstant: 196).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: spotifyImage.bottomAnchor, constant: 300).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 47).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -47).isActive = true
        
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 329).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 92).isActive = true
    }
}
