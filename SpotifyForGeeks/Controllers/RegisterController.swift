//
//  RegisterController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 21/7/24.
//

import UIKit

class RegisterController: UIViewController {
    
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
        view.text = "Register"
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
    
    private lazy var fullNameTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Full Name"
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = UIColor.gray
        
        view.attributedPlaceholder = NSAttributedString(
            string: "Full Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        
        return view
    }()
    
    private lazy var enterEmailTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter Email"
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
    
    private lazy var createAccBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Create Account", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 66/255, green: 200/255, blue: 60/255, alpha: 1.0)
            view.layer.cornerRadius = 30
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addTarget(self, action: #selector(createAccBtnTapped), for: .touchUpInside)
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
        view.text = "Do You Have An Account? Sign In"
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
    
    @objc func createAccBtnTapped() {
        navigationController?.popViewController(animated: true)
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
        
        view.addSubview(fullNameTF)
        fullNameTF.translatesAutoresizingMaskIntoConstraints = false
        fullNameTF.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 27).isActive = true
        fullNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        fullNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        fullNameTF.heightAnchor.constraint(equalToConstant: 80).isActive = true
        fullNameTF.widthAnchor.constraint(equalToConstant: 334).isActive = true
        
        view.addSubview(enterEmailTF)
        enterEmailTF.translatesAutoresizingMaskIntoConstraints = false
        enterEmailTF.topAnchor.constraint(equalTo: fullNameTF.bottomAnchor, constant: 16).isActive = true
        enterEmailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        enterEmailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        enterEmailTF.heightAnchor.constraint(equalToConstant: 80).isActive = true
        enterEmailTF.widthAnchor.constraint(equalToConstant: 334).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: enterEmailTF.bottomAnchor, constant: 16).isActive = true
        passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 80).isActive = true
        passwordTF.widthAnchor.constraint(equalToConstant: 334).isActive = true
        
        view.addSubview(createAccBtn)
        createAccBtn.translatesAutoresizingMaskIntoConstraints = false
        createAccBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 33).isActive = true
        createAccBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        createAccBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        createAccBtn.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(horizontalSV)
        horizontalSV.translatesAutoresizingMaskIntoConstraints = false
        horizontalSV.topAnchor.constraint(equalTo: createAccBtn.bottomAnchor, constant: 25).isActive = true
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
