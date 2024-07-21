//
//  SignInController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 21/7/24.
//

import UIKit

class SignInController: UIViewController {

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
    
    private lazy var registerLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign In"
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "If You Need Any Support Click Here"
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private lazy var enterEmailTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter Username Or Email"
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = UIColor.gray
        
        view.attributedPlaceholder = NSAttributedString(
            string: "Enter Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        
        return view
    }()
    
    private lazy var passwordTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = UIColor.gray
        
        view.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always

        let eyeImage = UIImage(named: "eye")
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(eyeImage, for: .normal)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        eyeButton.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 26))
        rightViewContainer.addSubview(eyeButton)
        eyeButton.center = rightViewContainer.center
        
        view.rightView = rightViewContainer
        view.rightViewMode = .always
        
        return view
    }()
    
    private lazy var recoveryPasswordLabel: UILabel = {
        let view = UILabel()
        view.text = "Recovery Password"
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    private lazy var signInBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 66/255, green: 200/255, blue: 60/255, alpha: 1.0)
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var grayLineLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 146).isActive = true
        return view
    }()
    
    private lazy var grayLineRight: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 146).isActive = true
        return view
    }()
    
    private lazy var orLabel: UILabel = {
        let view = UILabel()
        view.text = "Or"
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private lazy var horizontalSV: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var googleLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "google")
        return view
    }()
    
    private lazy var appleLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "apple")
        return view
    }()
    
    private lazy var logoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleLogo, appleLogo])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 50
        return stackView
    }()
    
    private lazy var notAMemberLabel: UILabel = {
        let view = UILabel()
        view.text = "Not A Member ? Register Now"
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    @objc func leftBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func eyeTapped() {
        passwordTF.isSecureTextEntry.toggle()
    }
    
    @objc func signInBtnTapped() {
    }
    
    private func setupConstraints() {
        view.addSubview(leftBtn)
        leftBtn.translatesAutoresizingMaskIntoConstraints = false
        leftBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        leftBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        leftBtn.heightAnchor.constraint(equalToConstant: 36).isActive = true
        leftBtn.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(spotifyImage)
        spotifyImage.translatesAutoresizingMaskIntoConstraints = false
        spotifyImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        spotifyImage.centerYAnchor.constraint(equalTo: leftBtn.centerYAnchor).isActive = true
        spotifyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spotifyImage.heightAnchor.constraint(equalToConstant: 33).isActive = true
        spotifyImage.widthAnchor.constraint(equalToConstant: 108).isActive = true
        
        view.addSubview(registerLabel)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.topAnchor.constraint(equalTo: spotifyImage.bottomAnchor, constant: 47).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 20).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(enterEmailTF)
        enterEmailTF.translatesAutoresizingMaskIntoConstraints = false
        enterEmailTF.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 39).isActive = true
        enterEmailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        enterEmailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        enterEmailTF.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: enterEmailTF.bottomAnchor, constant: 16).isActive = true
        passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(recoveryPasswordLabel)
        recoveryPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        recoveryPasswordLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20).isActive = true
        recoveryPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        
        view.addSubview(signInBtn)
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.topAnchor.constraint(equalTo: recoveryPasswordLabel.bottomAnchor, constant: 24).isActive = true
        signInBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        signInBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(horizontalSV)
        horizontalSV.translatesAutoresizingMaskIntoConstraints = false
        horizontalSV.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 25).isActive = true
        horizontalSV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        horizontalSV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        horizontalSV.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        horizontalSV.addArrangedSubview(grayLineLeft)
        horizontalSV.addArrangedSubview(orLabel)
        horizontalSV.addArrangedSubview(grayLineRight)
        
        view.addSubview(logoStackView)
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        logoStackView.topAnchor.constraint(equalTo: horizontalSV.bottomAnchor, constant: 20).isActive = true
        logoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appleLogo.centerYAnchor.constraint(equalTo: googleLogo.centerYAnchor).isActive = true
        
        view.addSubview(notAMemberLabel)
        notAMemberLabel.translatesAutoresizingMaskIntoConstraints = false
        notAMemberLabel.topAnchor.constraint(equalTo: logoStackView.bottomAnchor, constant: 20).isActive = true
        notAMemberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
