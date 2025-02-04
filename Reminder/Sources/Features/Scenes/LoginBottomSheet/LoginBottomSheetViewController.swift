//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Arthur Rios on 10/10/24.
//

import Foundation
import UIKit

// MVVM-C
class LoginBottomSheetViewController: UIViewController {
    let viewModel = LoginBottomSheetViewModel()
    let contentView: LoginBottomSheetView
    var handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWilHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.54).isActive = true
    }
    
    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardFrame.height
        
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -keyboardHeight / 1.7
        }
    }
    
    @objc
    private func keyboardWilHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    private func bindViewModel () {
        viewModel.successResult = { [weak self] usernameLogin in
            self?.presentSaveLoginAlert(email: usernameLogin)
        }
        
        viewModel.errorResult = { [weak self] errorMessage in
            self?.presentErrorAlert(message: errorMessage)
        }
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro ao logar", message: message, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Tentar novamente", style: .default)
        
        alertController.addAction(retryAction)
        
        self.present(alertController, animated: true)
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar Acesso", message: "Deseja salvar seu acesso?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) { _ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func setupGesture() {
        //proxima aula
    }
    
    private func handlePanGesture() {
        //proxima aula
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(usernameLogin: user, password: password)
    }
}


