//  ChooseModeController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 20/7/24.
//

import UIKit
import SnapKit

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
        duaLipaImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(spotifyImage)
        spotifyImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(97)
            make.right.equalToSuperview().offset(-97)
            make.height.equalTo(59)
            make.width.equalTo(196)
        }
        
        view.addSubview(chooseModeLabel)
        chooseModeLabel.snp.makeConstraints { make in
            make.top.equalTo(spotifyImage.snp.bottom).offset(340)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(horizontalSV)
        horizontalSV.snp.makeConstraints { make in
            make.top.equalTo(chooseModeLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(235)
        }
        
        horizontalSV.addArrangedSubview(darkModeButton)
        horizontalSV.addArrangedSubview(lightModeButton)
        
        darkModeButton.snp.makeConstraints { make in
            make.height.equalTo(73)
            make.width.equalTo(73)
        }
        
        lightModeButton.snp.makeConstraints { make in
            make.height.equalTo(73)
            make.width.equalTo(73)
        }
        
        view.addSubview(continueBtn)
        continueBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(329)
            make.height.equalTo(92)
        }
    }
}
