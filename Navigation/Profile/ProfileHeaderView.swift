//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия Филимонова on 10.04.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        createViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.backgroundColor = .clear
        photoImageView.image = UIImage(named: "IMG_7007")
        photoImageView.layer.cornerRadius = 60
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = UIColor.white.cgColor
        return photoImageView
    }()

    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Yuliya Nova"
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textAlignment = .center
        return userNameLabel
    }()

    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        return statusLabel
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.placeholder = "Set your status..."
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_ :)),
                                  for: .editingChanged)
        return statusTextField
    }()

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        statusButton.tintColor = .white
        statusButton.layer.cornerRadius = 4
        statusButton.setTitle("Set status", for: .normal)
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return statusButton
    }()

    @objc private func buttonPressed() {
        if let text = statusText {
            statusLabel.text = text
            statusTextField.isHidden = true
            statusButton.setTitle("Change status", for: .normal)
        }
    }

    private func createViews() {
        [photoImageView, userNameLabel, statusLabel, statusTextField, statusButton].forEach {addSubview($0)}

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            photoImageView.heightAnchor.constraint(equalToConstant: 120),
            photoImageView.widthAnchor.constraint(equalToConstant: 120)
        ])

        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54)
        ])

        NSLayoutConstraint.activate([
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusTextField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor,
                                                     constant: 20),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
