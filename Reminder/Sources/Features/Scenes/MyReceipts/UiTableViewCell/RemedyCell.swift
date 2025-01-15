//
//  RemedyCell.swift
//  Reminder
//
//  Created by Arthur Rios on 15/01/25.
//

import Foundation
import UIKit

class RemedyCell : UITableViewCell {
    
    static let identifier = "RemedyCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let recurrencyBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recurrencyLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let watchIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "watch"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recurrenceIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "recurrence-icon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrencyBackgroundView)
        contentView.addSubview(trashButton)
        
        timeBackgroundView.addSubview(watchIcon)
        timeBackgroundView.addSubview(timeLabel)
        
        recurrencyBackgroundView.addSubview(recurrenceIcon)
        recurrencyBackgroundView.addSubview(recurrencyLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.medier),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.medium),
            
            timeBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.small),
            timeBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.medium),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            watchIcon.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: Metrics.small),
            watchIcon.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            watchIcon.heightAnchor.constraint(equalToConstant: 16),
            watchIcon.widthAnchor.constraint(equalToConstant: 16),
            
            timeLabel.leadingAnchor.constraint(equalTo: watchIcon.trailingAnchor, constant: Metrics.tiny),
            timeLabel.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: -Metrics.small),
            
            recurrencyBackgroundView.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            recurrencyBackgroundView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: Metrics.tiny),
            recurrencyBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            recurrenceIcon.leadingAnchor.constraint(equalTo: recurrencyBackgroundView.leadingAnchor, constant: Metrics.small),
            recurrenceIcon.centerYAnchor.constraint(equalTo: recurrencyBackgroundView.centerYAnchor),
            recurrenceIcon.heightAnchor.constraint(equalToConstant: 16),
            recurrenceIcon.widthAnchor.constraint(equalToConstant: 16),
            
            recurrencyLabel.leadingAnchor.constraint(equalTo: recurrenceIcon.trailingAnchor, constant: Metrics.tiny),
            recurrencyLabel.centerYAnchor.constraint(equalTo: recurrencyBackgroundView.centerYAnchor),
            recurrencyLabel.trailingAnchor.constraint(equalTo: recurrencyBackgroundView.trailingAnchor, constant: -Metrics.small),
            
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.medium),
            trashButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            trashButton.heightAnchor.constraint(equalToConstant: 16),
            trashButton.widthAnchor.constraint(equalToConstant: 16),
            
            contentView.bottomAnchor.constraint(equalTo: timeBackgroundView.bottomAnchor, constant: Metrics.medium)
        ])
    }
    
    func configure(title: String, time: String, recurrence: String) {
        titleLabel.text = title
        timeLabel.text = time
        recurrencyLabel.text = recurrence
    }
}
