//  RegisterController.swift
//  SpotifyForGeeks
//
//  Created by Alexey Lim on 21/7/24.
//

import UIKit
import SnapKit

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
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(146)
        }
        return view
    }()
    
    private lazy var grayLineRight: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(146)
        }
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
        leftBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(25)
            make.height.width.equalTo(36)
        }
        
        view.addSubview(spotifyImage)
        spotifyImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerY.equalTo(leftBtn.snp.centerY)
            make.centerX.equalToSuperview()
            make.height.equalTo(33)
            make.width.equalTo(108)
        }
        
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(spotifyImage.snp.bottom).offset(47)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(fullNameTF)
        fullNameTF.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(27)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(80)
            make.width.equalTo(334)
        }
        
        view.addSubview(enterEmailTF)
        enterEmailTF.snp.makeConstraints { make in
            make.top.equalTo(fullNameTF.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(80)
            make.width.equalTo(334)
        }
        
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(enterEmailTF.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(80)
            make.width.equalTo(334)
        }
        
        view.addSubview(createAccBtn)
        createAccBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(80)
        }
        
        view.addSubview(horizontalSV)
        horizontalSV.snp.makeConstraints { make in
            make.top.equalTo(createAccBtn.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.height.equalTo(15)
        }
        
        horizontalSV.addArrangedSubview(grayLineLeft)
        horizontalSV.addArrangedSubview(orLabel)
        horizontalSV.addArrangedSubview(grayLineRight)
        
        view.addSubview(logoStackView)
        logoStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalSV.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(notAMemberLabel)
        notAMemberLabel.snp.makeConstraints { make in
            make.top.equalTo(logoStackView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
