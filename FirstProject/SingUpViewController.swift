//
//  SignUpViewController.swift
//  FirstProject
//
//  Created by Владимир on 19.02.2022.
//

import UIKit
import SnapKit
class SignUpViewController: UIViewController {
//MARK: Views
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    private let userNameTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your username"
        return textField
    }()
    
    private let emailTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your email"
        return textField
    }()
    private let passwordTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        return textField
    }()
    private let repeatedPasswordTextField : UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password again"
        textField.isSecureTextEntry = true
        return textField
    }()
    private let registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Resister", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    private var textFieldStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
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
            title = "Registration"
            view.backgroundColor = .white
            textFieldStackView.addArrangedSubview(userNameTextField)
            textFieldStackView.addArrangedSubview(emailTextField)
            textFieldStackView.addArrangedSubview(passwordTextField)
            textFieldStackView.addArrangedSubview(repeatedPasswordTextField)
            view.addSubview(scrollView)
            scrollView.addSubview(textFieldStackView)
            scrollView.addSubview(registerButton)
        }
        private func setupDelegate() {
            userNameTextField.delegate = self
            emailTextField.delegate = self
            passwordTextField.delegate = self
            repeatedPasswordTextField.delegate = self
        }
    @objc private func registerTapped() {
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
            maker.top.equalTo(scrollView).inset(20)
            maker.left.equalTo(scrollView).inset(20)
            maker.right.equalTo(scrollView).inset(20)
        }
        registerButton.snp.makeConstraints{ maker in
            maker.centerX.equalTo(scrollView)
            maker.bottom.equalTo(textFieldStackView).offset(100)
            maker.width.equalTo(80)
            maker.height.equalTo(40)
        }
        
    }
}
//MARK: -Extesion
    extension SignUpViewController : UITextFieldDelegate {
        func textFieldShouldReturn(_ textField : UITextField) -> Bool {
            userNameTextField.resignFirstResponder()
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            repeatedPasswordTextField.resignFirstResponder()
            return true
        }
    }
