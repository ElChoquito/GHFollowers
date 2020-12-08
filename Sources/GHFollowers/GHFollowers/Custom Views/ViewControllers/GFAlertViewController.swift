//
//  GFAlertViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 18/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFAlertViewController: UIViewController {
    
    let containerView = GFAlertContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "gfAlertViewController.actionButton.defaultText")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String?, message: String?, buttonTitle: String?){
        super.init(nibName: nil, bundle: nil)
        if let title = title {
            self.alertTitle = NSLocalizedString(title)
        }
        if let message = message {
            self.message = NSLocalizedString(message)
        }
        if let buttonTitle = buttonTitle {
            self.buttonTitle = NSLocalizedString(buttonTitle)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubview(containerView, titleLabel, actionButton, messageLabel)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
//MARK: UI
private extension GFAlertViewController {
    func configureContainerView() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? NSLocalizedString("gfAlertViewController.titleLabel.defaultText")
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? NSLocalizedString("gfAlertViewController.actionButton.defaultText"),
                              for: .normal)
        actionButton.addTarget(self,
                               action: #selector(dismissViewController),
                               for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel() {
        messageLabel.text = message ?? NSLocalizedString("gfAlertViewController.messageLabel.defaultText")
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
}
