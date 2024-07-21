//
//  ChooseModeController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 20/7/24.
//

import UIKit

class ChooseModeController: UIViewController {

    private lazy var duaLipaImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "dualipa")
        return view
    }()
    
    private lazy var spotifyImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spotify")
        return view
    }()
    
    private lazy var chooseModeLabel: UILabel = {
        let view = UILabel()
        view.text = "Choose Mode"
        view.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.textColor = .white
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var darkModeButton: UIStackView = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "moon"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 73/2
        
        let label = UILabel()
        label.text = "Dark Mode"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
        let stackView = UIStackView(arrangedSubviews: [button, label])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var lightModeButton: UIStackView = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "sun.max"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 73/2
        
        let label = UILabel()
        label.text = "Light Mode"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        
        let stackView = UIStackView(arrangedSubviews: [button, label])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var horizontalSV: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var continueBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 66/255, green: 200/255, blue: 60/255, alpha: 1.0)
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addTarget(self, action: #selector(continueBtnTapped), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupConstraints()
    }
    
    @objc func continueBtnTapped() {
        let vc = RegisterSignInController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraints() {
        view.addSubview(duaLipaImage)
        duaLipaImage.translatesAutoresizingMaskIntoConstraints = false
        duaLipaImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        duaLipaImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        duaLipaImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        duaLipaImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(spotifyImage)
        spotifyImage.translatesAutoresizingMaskIntoConstraints = false
        spotifyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        spotifyImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 97).isActive = true
        spotifyImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -97).isActive = true
        spotifyImage.heightAnchor.constraint(equalToConstant: 59).isActive = true
        spotifyImage.widthAnchor.constraint(equalToConstant: 196).isActive = true  
        
        view.addSubview(chooseModeLabel)
        chooseModeLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseModeLabel.topAnchor.constraint(equalTo: spotifyImage.bottomAnchor, constant: 340).isActive = true
        chooseModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(horizontalSV)
        horizontalSV.translatesAutoresizingMaskIntoConstraints = false
        horizontalSV.topAnchor.constraint(equalTo: chooseModeLabel.bottomAnchor, constant: 10).isActive = true
        horizontalSV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        horizontalSV.heightAnchor.constraint(equalToConstant: 150).isActive = true
        horizontalSV.widthAnchor.constraint(equalToConstant: 235).isActive = true
        
        horizontalSV.addArrangedSubview(darkModeButton)
        horizontalSV.addArrangedSubview(lightModeButton)
        
        darkModeButton.heightAnchor.constraint(equalToConstant: 73).isActive = true
        darkModeButton.widthAnchor.constraint(equalToConstant: 73).isActive = true
        lightModeButton.heightAnchor.constraint(equalToConstant: 73).isActive = true
        lightModeButton.widthAnchor.constraint(equalToConstant: 73).isActive = true
        
        view.addSubview(continueBtn)
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        continueBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueBtn.widthAnchor.constraint(equalToConstant: 329).isActive = true
        continueBtn.heightAnchor.constraint(equalToConstant: 92).isActive = true
    }
}
