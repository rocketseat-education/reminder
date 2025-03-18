//
//  NewReceipt.swift
//  Reminder
//
//  Created by Arthur Rios on 11/12/24.
//

import Foundation
import UIKit
import Lottie
import CoreFramework

class NewReceiptViewController: UIViewController {
    private let newReceiptView = NewReceiptView()
    private let viewModel = NewReceiptViewModel()

    private let successAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "success")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.isHidden = true
        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setActions()
        let onboarding = OnboardingView()
        presentOnboarding()
    }

    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newReceiptView)
        view.addSubview(successAnimationView)
        self.navigationItem.hidesBackButton = true

        setupConstraints()
    }

    private func setupConstraints() {
        newReceiptView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newReceiptView.topAnchor.constraint(equalTo: view.topAnchor),
            newReceiptView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newReceiptView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newReceiptView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            successAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            successAnimationView.widthAnchor.constraint(equalToConstant: 120),
            successAnimationView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    private func setActions() {
        newReceiptView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        newReceiptView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc private func addButtonTapped() {
        let remedy = newReceiptView.remedyInput.getText()
        let time = newReceiptView.timeInput.getText()
        let recurrence = newReceiptView.recurrenceInput.getText()
        let takeNow = false

        viewModel.addReceipt(remedy: remedy,
                             time: time,
                             recurrence: recurrence,
                             takeNow: takeNow)

        playSuccessAnimation()
        print("receita \(remedy) adicionada")
    }

    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    private func clearFieldsAndResetButton() {
        newReceiptView.remedyInput.textField.text = ""
        newReceiptView.timeInput.textField.text = ""
        newReceiptView.recurrenceInput.textField.text = ""
        newReceiptView.addButton.isEnabled = false
    }

    private func playSuccessAnimation() {
        successAnimationView.isHidden = false
        successAnimationView.play { [weak self] finished in
            if finished {
                self?.successAnimationView.isHidden = true
                self?.clearFieldsAndResetButton()
            }
        }
    }

    private func presentOnboarding() {
        if !UserDefaultsManager.hasSeenOnboarding() {
            let onboardingView = OnboardingView()
            let steps = [
                (UIImage(named: "image1"), "Bem vindo ao Onboarding do Reminder"),
                (UIImage(named: "image2"), "É fácil cadastrar seus remédios, tão simples quanto um click"),
                (UIImage(named: "image3"), "Selecione o horário da primeira dose, e as subsequentes"),
                (UIImage(named: "image4"), "Iremos te lembrar na hora de tomar o medicamento")
            ]

            onboardingView.presentOnboarding(on: view, with: steps)
            UserDefaultsManager.markOnboardingAsSeen()
        }
    }
}
