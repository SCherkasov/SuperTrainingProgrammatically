//
//  Alert.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

protocol AlertDelegate {
  func dissmissAlert()
}

class Alert: UIView {
  
  var delegate: AlertDelegate?
  
  let okButton = UIButton()
  let messageLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black
    createMessageLabel()
    createOkButton()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createOkButton() {
    okButton.backgroundColor = .black
    okButton.setTitle("ok", for: .normal)
    okButton.setTitleColor(.white, for: .normal)
    okButton.addTarget(self, action: #selector(okButtonAction), for: .touchUpInside)
    okButton.translatesAutoresizingMaskIntoConstraints = false
    okButton.layer.cornerRadius = 5
    okButton.layer.borderColor = UIColor.white.cgColor
    okButton.layer.borderWidth = 1.0
    addSubview(okButton)
    
    okButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    okButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 1).isActive = true
    okButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -1).isActive = true
    okButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
    
  }
  
  @objc func okButtonAction() {
    delegate?.dissmissAlert()
  }
  
  func createMessageLabel() {
    messageLabel.text = "Login or password are wrong..."
    messageLabel.textColor = .white
    messageLabel.numberOfLines = 3
    messageLabel.textAlignment = .center
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(messageLabel)
    
    messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    messageLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    messageLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
  }
  
}

