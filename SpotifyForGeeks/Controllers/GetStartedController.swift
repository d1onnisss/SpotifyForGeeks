//  GetStartedController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 20/7/24.
//

import UIKit
import SnapKit

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
        arianaImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(spotifyImage)
        spotifyImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.height.equalTo(59)
            make.width.equalTo(196)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(spotifyImage.snp.bottom).offset(300)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(47)
            make.right.equalToSuperview().offset(-47)
        }
        
        view.addSubview(getStartedBtn)
        getStartedBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(329)
            make.height.equalTo(92)
        }
    }
}
