//
//  Checkbox.swift
//  Reminder
//
//  Created by Arthur Rios on 11/12/24.
//

import Foundation
import UIKit
import CoreFramework

class Checkbox: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.input
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let checkbox: ToggleCheckbox = {
        let button = ToggleCheckbox()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(title: String) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = title
        setupView()
        setupAccessibility()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(checkbox)
        addSubview(titleLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),

            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupAccessibility() {
        isAccessibilityElement = true
        accessibilityLabel = "Checkbox para tomar o remédio na hora atual"
        accessibilityHint = "Toque neste componente, que é um quadrado, para alternar se você tomou o remédio agora ou não."
        accessibilityTraits = [.button]
        
        checkbox.addTarget(self, action: #selector(checkboxToggled), for: .touchUpInside)
    }
    
    @objc
    private func checkboxToggled() {
        let isChecked = checkbox.getIsCheckedState()
        if isChecked {
            accessibilityTraits = [.button, .selected]
            UIAccessibility.post(notification: .announcement, argument: "Checkbox marcado")
        } else {
            accessibilityTraits = [.button]
            UIAccessibility.post(notification: .announcement, argument: "Checkbox desmarcado")
        }
    }
}
