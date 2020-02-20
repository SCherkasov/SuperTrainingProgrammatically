//
//  FlagsController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import Firebase

class FlagsController: UIViewController {
  
  let hereLabel = UILabel()
  let blackView = UIView()
  let signOutButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .black
    self.navigationController?.navigationBar.isHidden = true
    authenticateUserAndConfigureView()
  }
  
  func createLabel() {
    hereLabel.textColor = .white
    hereLabel.textAlignment = .center
    view.addSubview(hereLabel)
    
    hereLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      hereLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      hereLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      hereLabel.heightAnchor.constraint(equalToConstant: 90),
      hereLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8)
      ])
  }
  
  func createSignOutButton() {
    signOutButton.setTitle("signOut", for: .normal)
    signOutButton.setTitleColor(.white, for: .normal)
    signOutButton.addTarget(self, action: #selector(signOutAction), for: .touchUpInside)
    signOutButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
    signOutButton.center.x = self.view.center.x
    signOutButton.center.y = self.view.center.y + 100
    view.addSubview(signOutButton)
  }
  
  @objc func signOutAction() {
    do {
      try Auth.auth().signOut()
      let navCont = UINavigationController(rootViewController: LoginController())
      self.present(navCont, animated: true, completion: nil)
    } catch let error {
      print("Failed to signOut with error..", error)
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
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
  
  func authenticateUserAndConfigureView() {
    if Auth.auth().currentUser == nil {
      DispatchQueue.main.async {
        let navCont = UINavigationController(rootViewController: LaunchViewController())
        self.present(navCont, animated: true, completion: nil)
      }
    } else {
      createLabel()
      loadUserData()
      createSignOutButton()
      createBlackView()
      animation()
    }
  }
  
  // get users name
  func loadUserData() {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    Database.database().reference().child("users").child(uid).child("userName").observeSingleEvent(of: .value) { (snapshot) in
      guard let userName = snapshot.value as? String else { return }
      self.hereLabel.text = "You are here, \(userName) :))"
    }
  }
  
}

