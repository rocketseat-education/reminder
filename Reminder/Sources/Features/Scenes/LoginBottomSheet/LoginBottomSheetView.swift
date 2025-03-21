//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Arthur Rios on 10/10/24.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loginTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.loginText.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.passwordText.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.body
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.little
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.leftView = paddingView
        text.leftViewMode = .always
        text.rightView = paddingView
        text.rightViewMode = .always

        return text
    }()

    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.leftView = paddingView
        text.leftViewMode = .always
        text.rightView = paddingView
        text.rightViewMode = .always

        return text
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func exampleTapped() {
        print("clicou na label")
    }

    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.medium

        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(passwordTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.high),

            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.high),

            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.high),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.high),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.high),

            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.high),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.high),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            loginButton.topAnchor.constraint(greaterThanOrEqualTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }

    @objc
    private func loginButtonTapped() {
        let password = passwordTextField.text ?? ""
        let user = emailTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }

    private func setupDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginBottomSheetView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
