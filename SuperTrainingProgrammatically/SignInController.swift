//
//  SignInController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Firebase

class SignInController: UIViewController {
  
  let mainStackView = UIStackView()
  let emailStackView = UIStackView()
  let userNameStackView = UIStackView()
  let passwordStackView = UIStackView()
  let mainView = UIView()
  let bottomView = UIView()
  let emailTextField = UITextField()
  let lineInBottomToEmail = UIView()
  let userNameTextField = UITextField()
  let lineInBottomToUserName = UIView()
  let passwordTextField = UITextField()
  let lineInBottomToPassword = UIView()
  let createAccount = UIButton()
  let goToLoginButton = UIButton()
  let blackView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    self.view.backgroundColor = .yellow
    self.navigationController?.navigationBar.isHidden = true
    
    createMainView()
    createBottomView()
    createEmailTextField()
    createLineInBottomEmail()
    createEmailStackView()
    createUserNameTextField()
    createLineInBottomToUserName()
    createUserNameStackView()
    createPasswordTextField()
    createLineInBottomToPassword()
    createPasswordStackView()
    createAccountButton()
    createMainStackView()
    createGoToLoginButton()
    createBlackView()
    animation()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  @objc func keyboardWillShow(sender: NSNotification) {
    self.view.frame.origin.y = -100
  }
  
  @objc func keyboardWillHide(sender: NSNotification) {
    self.view.frame.origin.y = 0
  }
  
  func createMainView() {
    mainView.backgroundColor = .black
    mainView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.9)
    view.addSubview(mainView)
  }
  
  func createBottomView() {
    bottomView.backgroundColor = .black
    bottomView.frame = CGRect(x: 0, y: view.frame.height * 0.9, width: view.frame.width, height: view.frame.height * 0.1)
    view.addSubview(bottomView)
  }
  
  func createBlackView() {
    blackView.backgroundColor = .black
    blackView.alpha = 1
    blackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    view.addSubview(blackView)
  }
  
  func animation() {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
      UIView.animate(withDuration: 3, delay: 0.5, options: [], animations: {
        self.blackView.alpha = 0
      }, completion: nil)
    }
  }
  
  func createEmailTextField() {
    emailTextField.attributedPlaceholder = NSAttributedString(string: "email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    emailTextField.keyboardType = .emailAddress
    emailTextField.textColor = .white
    emailTextField.textAlignment = .left
    
    emailTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createLineInBottomEmail() {
    lineInBottomToEmail.backgroundColor = .white
    
    lineInBottomToEmail.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    lineInBottomToEmail.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createEmailStackView() {
    emailStackView.axis  = NSLayoutConstraint.Axis.vertical
    emailStackView.distribution  = UIStackView.Distribution.equalSpacing
    emailStackView.alignment = UIStackView.Alignment.center
    emailStackView.spacing   = 0.0
    
    emailStackView.addArrangedSubview(emailTextField)
    emailStackView.addArrangedSubview(lineInBottomToEmail)
  }
  
  func createUserNameTextField() {
    userNameTextField.attributedPlaceholder = NSAttributedString(string: "user name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    userNameTextField.keyboardType = .default
    userNameTextField.textColor = .white
    
    userNameTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    userNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createLineInBottomToUserName() {
    lineInBottomToUserName.backgroundColor = .white
    
    lineInBottomToUserName.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    lineInBottomToUserName.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createUserNameStackView() {
    userNameStackView.axis  = NSLayoutConstraint.Axis.vertical
    userNameStackView.distribution  = UIStackView.Distribution.equalSpacing
    userNameStackView.alignment = UIStackView.Alignment.center
    userNameStackView.spacing   = 0.0
    
    userNameStackView.addArrangedSubview(userNameTextField)
    userNameStackView.addArrangedSubview(lineInBottomToUserName)
  }
  
  func createPasswordTextField() {
    passwordTextField.attributedPlaceholder = NSAttributedString(string: "password",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    passwordTextField.keyboardType = .default
    passwordTextField.textColor = .white
    passwordTextField.isSecureTextEntry = true
    
    passwordTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createLineInBottomToPassword() {
    lineInBottomToPassword.backgroundColor = .white
    
    lineInBottomToPassword.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    lineInBottomToPassword.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  func createPasswordStackView() {
    passwordStackView.axis  = NSLayoutConstraint.Axis.vertical
    passwordStackView.distribution  = UIStackView.Distribution.equalSpacing
    passwordStackView.alignment = UIStackView.Alignment.center
    passwordStackView.spacing   = 0.0
    
    passwordStackView.addArrangedSubview(passwordTextField)
    passwordStackView.addArrangedSubview(lineInBottomToPassword)
  }
  
  func createAccountButton() {
    createAccount.setTitle("create",for: .normal)
    createAccount.setTitleColor(.white, for: .normal)
    createAccount.addTarget(self, action: #selector(create), for: .touchUpInside)
    
    createAccount.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    createAccount.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  @objc func create() {
    
    guard let email = emailTextField.text else { return }
    guard let userName = userNameTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    
    createUser(withEmail: email, password: password, userName: userName)
    
    self.emailTextField.endEditing(true)
    self.userNameTextField.endEditing(true)
    self.passwordTextField.endEditing(true)
    
    UIView.animate(withDuration: 2.5,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 1
                    
    }, completion: nil)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  func createMainStackView() {
    mainStackView.axis  = NSLayoutConstraint.Axis.vertical
    mainStackView.distribution  = UIStackView.Distribution.equalSpacing
    mainStackView.alignment = UIStackView.Alignment.center
    mainStackView.spacing   = 40.0
    
    mainStackView.addArrangedSubview(emailStackView)
    mainStackView.addArrangedSubview(userNameStackView)
    mainStackView.addArrangedSubview(passwordStackView)
    mainStackView.addArrangedSubview(createAccount)
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    
    self.mainView.addSubview(mainStackView)
    
    mainStackView.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
    mainStackView.centerYAnchor.constraint(equalTo: self.mainView.centerYAnchor).isActive = true
  }
  
  func createGoToLoginButton() {
    goToLoginButton.setTitle("login",for: .normal)
    goToLoginButton.setTitleColor(.white, for: .normal)
    goToLoginButton.center.x = bottomView.center.x
    goToLoginButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    bottomView.addSubview(goToLoginButton)
    goToLoginButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      goToLoginButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
      goToLoginButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
      goToLoginButton.heightAnchor.constraint(equalToConstant: 40),
      goToLoginButton.widthAnchor.constraint(equalToConstant: bottomView.frame.width * 0.8)
      ])
  }
  
  @objc func goToLogin() {
    self.view.endEditing(true)
    UIView.animate(withDuration: 2.5,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 1
    }, completion: nil)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func createUser(withEmail email: String, password: String, userName: String) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      
      if let error = error {
        print("Failed to sign user up with error: ", error.localizedDescription)
        return
      }
      
      guard let uid = result?.user.uid else { return }
      
      let values = ["email": email, "userName": userName]
      
      Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
        if let error = error {
          print("Failed to update database values with error: ", error.localizedDescription)
          return
        }
      })
    }
  }
}

