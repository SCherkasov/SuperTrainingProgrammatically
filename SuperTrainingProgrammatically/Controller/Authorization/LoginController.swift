//
//  LoginController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
  
  let mainStackView = UIStackView()
  let emailStackView = UIStackView()
  let passwordStackView = UIStackView()
  let mainView = UIView()
  let bottomView = UIView()
  let emailTextField = UITextField()
  let lineInBottomToEmail = UIView()
  let passwordTextField = UITextField()
  let lineInBottomToPassword = UIView()
  let loginButton = UIButton()
  let signInButton = UIButton()
  let blackView = UIView()
  
  let alertWindow = Alert()
  var blurEffect = UIVisualEffectView()
  
  override func viewWillAppear(_ animated: Bool) {
    animation()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    createMainView()
    createBottomView()
    createEmailTextField()
    createLineInBottomEmail()
    createPasswordTextField()
    createLineInBottomToPassword()
    createLoginButton()
    createSignInButton()
    createMainStackView()
    createEmailStackView()
    createPasswordStackView()
    createBlackView()
    animation()
    blurEffect.alpha = 0
    
    self.navigationController?.navigationBar.isHidden = true
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
  
  func createLoginButton() {
    loginButton.setTitle("login",for: .normal)
    loginButton.setTitleColor(.white, for: .normal)
    loginButton.addTarget(self, action: #selector(goToMainScreen), for: .touchUpInside)
    
    loginButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
  }
  
  @objc func goToMainScreen() {
    logUserIn()
  }
  
  func createMainStackView() {
    mainStackView.axis  = NSLayoutConstraint.Axis.vertical
    mainStackView.distribution  = UIStackView.Distribution.equalSpacing
    mainStackView.alignment = UIStackView.Alignment.center
    mainStackView.spacing   = 40.0
    
    mainStackView.addArrangedSubview(emailStackView)
    mainStackView.addArrangedSubview(passwordStackView)
    mainStackView.addArrangedSubview(loginButton)
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    self.mainView.addSubview(mainStackView)
    
    mainStackView.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
    mainStackView.centerYAnchor.constraint(equalTo: self.mainView.centerYAnchor).isActive = true
  }
  
  func createSignInButton() {
    signInButton.setTitle("sign in",for: .normal)
    signInButton.setTitleColor(.white, for: .normal)
    signInButton.center.x = bottomView.center.x
    signInButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
    bottomView.addSubview(signInButton)
    signInButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      signInButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
      signInButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
      signInButton.heightAnchor.constraint(equalToConstant: 40),
      signInButton.widthAnchor.constraint(equalToConstant: bottomView.frame.width * 0.8)
      ])
  }
  
  @objc func goToSignIn() {
    UIView.animate(withDuration: 2.5,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 1
    }, completion: nil)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      let vc = SignInController()
      let navVC = UINavigationController(rootViewController: vc)
      self.present(navVC, animated: true, completion: nil)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func logUserIn() {
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if error != nil {
        print("error signIn")
        self.emailTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
        self.createBlurEffect()
        self.createAlertWindow()
      } else {
        UIView.animate(withDuration: 2.5,
                       delay: 1.0,
                       options: [],
                       animations: {
                        self.blackView.alpha = 1
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
          
          let layout = UICollectionViewFlowLayout()
          let vc = FlagsController(collectionViewLayout: layout)
     
          let navVC = UINavigationController(rootViewController: vc)
          self.present(navVC, animated: true, completion: nil)
         
        }
      }
    }
  }
  
  func createAlertWindow() {
    alertWindow.layer.cornerRadius = 10
    alertWindow.delegate = self
    alertWindow.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(alertWindow)
    
    alertWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    alertWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    alertWindow.heightAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
    alertWindow.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
  }
  
  func createBlurEffect() {
    let effect = UIBlurEffect(style: .dark)
    blurEffect = UIVisualEffectView(effect: effect)
    view.addSubview(blurEffect)
    
    blurEffect.translatesAutoresizingMaskIntoConstraints = false
    blurEffect.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    blurEffect.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    blurEffect.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    blurEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
}

extension LoginController: AlertDelegate {
  func dissmissAlert() {
    self.alertWindow.removeFromSuperview()
    blurEffect.alpha = 0
    emailTextField.text = ""
    passwordTextField.text = ""
    emailTextField.becomeFirstResponder()
  }
}
