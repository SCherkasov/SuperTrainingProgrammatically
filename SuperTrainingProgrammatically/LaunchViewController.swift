//
//  LaunchViewController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  
  let oneEuroButton = UIButton()
  let blackView = UIView()
  let backgroundImage = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .black
    
    createBlackView()
    createBackgroundImage()
    createOneEuroButton()
    animationAppear()
    
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  func createBackgroundImage() {
    backgroundImage.image = UIImage(named: "backgroundImage")
    
    backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    view.addSubview(backgroundImage)
  }
  
  func createBlackView() {
    blackView.backgroundColor = .black
    blackView.alpha = 1
    blackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    backgroundImage.addSubview(blackView)
  }
  
  func animationAppear() {
    UIView.animate(withDuration: 3.0,
                   delay: 3.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 0
    }, completion: nil)
    
    UIView.animate(withDuration: 3.0,
                   delay: 3.5,
                   options: [],
                   animations: {
                    self.oneEuroButton.alpha = 1
    })
  }
  
  func createOneEuroButton() {
    oneEuroButton.setImage(UIImage(named: "1_euro"), for: .normal)
    oneEuroButton.alpha = 0
    view.addSubview(oneEuroButton)
    oneEuroButton.addTarget(self, action: #selector(goToLoginWithAniation), for: .touchUpInside)
    
    oneEuroButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      oneEuroButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      oneEuroButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      oneEuroButton.heightAnchor.constraint(equalToConstant: 150),
      oneEuroButton.widthAnchor.constraint(equalToConstant: 150)
      ])
  }
  
  @objc func goToLoginWithAniation() {
    
    oneEuroButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    
    UIView.animate(withDuration: 1.0,
                   delay: 0,
                   usingSpringWithDamping: 0.4,
                   initialSpringVelocity: 7.5,
                   options: .allowUserInteraction,
                   animations: { [weak self] in
                    self?.oneEuroButton.transform = .identity
      }, completion: nil)
    
    UIView.animate(withDuration: 3.0,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.blackView.alpha = 1
    }, completion: nil)
    
    UIView.animate(withDuration: 2.5,
                   delay: 1.0,
                   options: [],
                   animations: {
                    self.oneEuroButton.alpha = 0
                    
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      let vc = LoginController()
      let navVC = UINavigationController(rootViewController: vc)
      self.present(navVC, animated: true, completion: nil)
    }
  }
  
}

