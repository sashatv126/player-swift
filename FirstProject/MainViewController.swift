//
//  ViewController.swift
//  FirstProject
//
//  Created by Владимир on 19.02.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
//MARK: -Views
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let loginLabel : UILabel = {
       let label = UILabel()
        label.text = "LogIn"
        return label
    }()
    private let emailTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter email"
        return textField
    }()
    private let passwordTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    private let singUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(singUpTapped), for: .touchUpInside)
        return button
    }()
    private let singInButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Sign In", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(singInTapped), for: .touchUpInside)
        return button
    }()
    private var textFieldStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()
    private var buttonStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDelegate()
        setupConstraints()
    }
//MARK: - Private Func
    private func setupView() {
        title = "Sign In"
        view.backgroundColor = .white
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        buttonStackView.addArrangedSubview(singInButton)
        buttonStackView.addArrangedSubview(singUpButton)
        view.addSubview(scrollView)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(textFieldStackView)
        scrollView.addSubview(buttonStackView)
    }
    private func setupDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    @objc private func singInTapped() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let user = findUserInDataBase(mail: email)
        if user == nil {
            aleartController(title: "Error", message: "This email is not created", action: "OK")
        }
        else if password != user?.password {
            aleartController(title: "Error", message: "password is not right", action: "OK")
        }
        else {
            let naVC = UINavigationController(rootViewController: SignInViewController())
            let naVCMusic = UINavigationController(rootViewController: MusicViewController())
            let naVCAbout = UINavigationController(rootViewController: MoreViewController())
            let tabBar = UITabBarController()
            naVCMusic.tabBarItem = UITabBarItem.init(tabBarSystemItem: .search, tag: 1)
            naVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .topRated , tag: 2)
            naVCAbout.tabBarItem = UITabBarItem.init(tabBarSystemItem: .contacts , tag: 3)
            tabBar.viewControllers = [naVC,naVCMusic,naVCAbout ]
            tabBar.modalPresentationStyle = .fullScreen
             present(tabBar, animated: true)
        }
    }
    private func findUserInDataBase (mail : String) -> User? {
        let data = DataBase.shared.users
        for user in data {
            if user.email == mail {
                return user
            }
        }
        return nil
    }
    
    
    @objc private func singUpTapped() {
        let viewController = SignUpViewController()
        present(viewController, animated: true)
       
    }
//MARK: -Constraints
         private func setupConstraints() {
            scrollView.snp.makeConstraints{maker in
                maker.left.equalTo(view).inset(0)
                maker.right.equalTo(view).inset(0)
                maker.top.equalTo(view).inset(0)
                maker.bottom.equalTo(view).inset(0)
            }
            textFieldStackView.snp.makeConstraints{maker in
                maker.centerX.equalTo(scrollView)
                maker.centerY.equalTo(scrollView)
                maker.left.equalTo(scrollView).inset(20)
                maker.right.equalTo(scrollView).inset(20)
                
            }
            loginLabel.snp.makeConstraints{maker in
                maker.centerX.equalTo(scrollView)
                maker.bottom.equalTo(textFieldStackView.snp.top).inset(-30)
            }
            buttonStackView.snp.makeConstraints{maker in
                maker.left.equalTo(scrollView.snp.left).inset(20)
                maker.top.equalTo(textFieldStackView.snp.bottom).offset(30)
                maker.right.equalTo(scrollView.snp.right).inset(20)
            }
            singUpButton.snp.makeConstraints{maker in
                maker.height.equalTo(40)
            }
            singInButton.snp.makeConstraints{maker in
                maker.height.equalTo(40)
            }
            
        }
    }
//MARK: -Extesion
    extension MainViewController : UITextFieldDelegate {
        func textFieldShouldReturn(_ textField : UITextField) -> Bool {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            return true
        }
    }
