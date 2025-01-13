//
//  NewReceipt.swift
//  Reminder
//
//  Created by Arthur Rios on 11/12/24.
//

import Foundation
import UIKit

class NewReceiptViewController: UIViewController {
    private let newReceiptView = NewReceiptView()
    private let viewModel = NewReceiptViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newReceiptView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        newReceiptView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newReceiptView.topAnchor.constraint(equalTo: view.topAnchor),
            newReceiptView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newReceiptView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newReceiptView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        print("receita \(remedy) adicionada")
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
