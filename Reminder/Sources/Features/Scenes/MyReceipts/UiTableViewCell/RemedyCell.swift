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
            
        ])
    }
}
