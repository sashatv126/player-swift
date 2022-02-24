//
//  SignUpViewController.swift
//  FirstProject
//
//  Created by Владимир on 19.02.2022.
//

import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    let validName = String.ValidTypes.name
    let validEmail = String.ValidTypes.email
    let validPassword = String.ValidTypes.password
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
    private let labelValidname : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    private let labelValidEmail : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    private let labelValidPassword : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
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
            textFieldStackView.addArrangedSubview(labelValidname)
            textFieldStackView.addArrangedSubview(emailTextField)
            textFieldStackView.addArrangedSubview(labelValidEmail)
            textFieldStackView.addArrangedSubview(passwordTextField)
            textFieldStackView.addArrangedSubview(labelValidPassword)
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
        let username = userNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repeatPassword = repeatedPasswordTextField.text ?? ""
        
        if username.isValid(validTypes: validName) && email.isValid(validTypes: validEmail) && password.isValid(validTypes: validPassword){
            if password == repeatPassword {
                DataBase.shared.saveUsers(username: username, email: email, password: password, repeatPassword: repeatPassword)
                aleartController(title: "Sucsessful", message: "Thank you for registration",
                                 action: "dismiss")
            }
            else {
                aleartController(title: "Error", message: "Passwords are not the same ",
                                 action: "OK")
            }
        }
        else {
            aleartController(title: "Error", message: "Fill all fields ",
                             action: "OK")
        }
        
        
        
    }
    private func setTextField(textField : UITextField,label : UILabel? , validType : String.ValidTypes,validMessage : String, wrongMessage : String, string : String , range : NSRange) {
        let text = (textField.text ?? "") + string
        let result : String
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count-1)
            result = String(text[text.startIndex..<end])
        }
        else {
            result = text
        }
        textField.text = result
        if result.isValid(validTypes: validType) {
            if label != nil {
                label!.text = validMessage
                label!.textColor = .green
            }
        }
        else if label != nil {
            label!.text = wrongMessage
            label!.textColor = .red
        }
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
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            switch textField {
            case userNameTextField : setTextField(textField: textField,
                                                    label: labelValidname,
                                                    validType: validName,
                                                    validMessage: "Valid username",
                                                    wrongMessage: "only use a-z and A-z",
                                                    string: string,
                                                    range: range)
            case emailTextField : setTextField(textField: textField,
                                                    label: labelValidEmail,
                                                    validType: validEmail,
                                                    validMessage: "Valid email",
                                                    wrongMessage: "for example example@web.com",
                                                    string: string,
                                                    range: range)
            case passwordTextField : setTextField(textField: textField,
                                                    label: labelValidPassword,
                                                    validType: validPassword,
                                                    validMessage: "Valid password",
                                                    wrongMessage: "min 6 characters",
                                                    string: string,
                                                    range: range)
            case repeatedPasswordTextField : setTextField(textField: textField,
                                                          label: nil,
                                                          validType: validPassword,
                                                          validMessage: "",
                                                          wrongMessage: "",
                                                          string: string,
                                                          range: range)
            default : break
            }
            return false
        }
        
    }
