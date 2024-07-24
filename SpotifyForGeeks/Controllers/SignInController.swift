import UIKit
import SnapKit

class SignInController: UIViewController {

    private lazy var leftBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "leftBtn"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 36 / 2
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
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 20))
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
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 20))
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
        leftBtn.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(25)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        view.addSubview(spotifyImage)
        spotifyImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize(width: 108, height: 33))
            make.bottom.lessThanOrEqualTo(leftBtn.snp.bottom) 
        }
        
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(spotifyImage.snp.bottom).offset(47)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(enterEmailTF)
        enterEmailTF.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(39)
            make.left.equalTo(view.snp.left).offset(25)
            make.right.equalTo(view.snp.right).offset(-25)
            make.height.equalTo(80)
        }
        
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(enterEmailTF.snp.bottom).offset(16)
            make.left.equalTo(view.snp.left).offset(25)
            make.right.equalTo(view.snp.right).offset(-25)
            make.height.equalTo(80)
        }
        
        view.addSubview(recoveryPasswordLabel)
        recoveryPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(16)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(signInBtn)
        signInBtn.snp.makeConstraints { make in
            make.top.equalTo(recoveryPasswordLabel.snp.bottom).offset(29)
            make.left.equalTo(view.snp.left).offset(25)
            make.right.equalTo(view.snp.right).offset(-25)
            make.height.equalTo(55)
        }
        
        view.addSubview(horizontalSV)
        horizontalSV.snp.makeConstraints { make in
            make.top.equalTo(signInBtn.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        horizontalSV.addArrangedSubview(grayLineLeft)
        horizontalSV.addArrangedSubview(orLabel)
        horizontalSV.addArrangedSubview(grayLineRight)
        
        view.addSubview(logoStackView)
        logoStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalSV.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(notAMemberLabel)
        notAMemberLabel.snp.makeConstraints { make in
            make.top.equalTo(logoStackView.snp.bottom).offset(33)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}
