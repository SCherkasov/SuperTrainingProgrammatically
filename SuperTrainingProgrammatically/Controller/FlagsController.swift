//
//  FlagsController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

private let headerIdentifier = "HeaderIdentifier"
private let cellIdetifier = "CellIdentifier"

class FlagsController: UICollectionViewController {
  
  var coinStore = CoinStore()
  let blackView = UIView()
  
  lazy var conteinerView: UIView = {
    let topView = UIView()
    topView.backgroundColor = .black
    
    return topView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createBlackView()
    animationAppear()
    self.coinStore.loadCoins()
    
    collectionView.backgroundColor = .black
    view.addSubview(conteinerView)
    
    conteinerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: view.frame.height * 0.3)
    
    collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    
    collectionView.register(FlagCell.self, forCellWithReuseIdentifier: cellIdetifier)
    
    collectionView.contentInsetAdjustmentBehavior = .never
    
    self.navigationController?.navigationBar.isHidden = true
  }
  
  func createBlackView() {
    blackView.backgroundColor = .black
    blackView.alpha = 1
    blackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    view.addSubview(blackView)
  }
  
  func animationAppear() {
    UIView.animate(withDuration: 3.0,
                   delay: 1.5,
                   options: [],
                   animations: {
                    self.blackView.alpha = 0
    }, completion: nil)
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.coinStore.countries.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdetifier, for: indexPath) as! FlagCell
    
    cell.flagImageName.text = self.coinStore.countries[indexPath.row].name
    cell.flagImage.image = UIImage(named:
      self.coinStore.countries[indexPath.row].flagImageName)
    
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let layout = UICollectionViewFlowLayout()
    let vc = CoinsController(collectionViewLayout: layout)
    
            let countryPost = self.coinStore.countries[indexPath.row] as Country
            vc.selectedCountry = countryPost
    
    let navVC = UINavigationController(rootViewController: vc)
    self.present(navVC, animated: true, completion: nil)
//      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//      if let coinsVC = storyboard.instantiateViewController(withIdentifier: "CoinsViewController")
//        as? CoinsViewController
//      {
//        let countryPost = self.coinStore.countries[indexPath.row] as Country
//        coinsVC.selectedCountry = countryPost
//        self.navigationController?.pushViewController(coinsVC, animated: true)
//      }
    }
  
}

extension FlagsController {
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
    return header
  }
}

extension FlagsController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height * 0.3)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - view.frame.width * 0.25) / 3
    let w = view.frame.width
    print("\(width)")
    print("\(w)")
    
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
}

extension UIView {
  
  func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = 0, height: CGFloat? = 0) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
    }
    
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
    }
    
    if let bottom = bottom {
      if let paddingBottom = paddingBottom {
        bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
      }
    }
    
    if let right = right {
      if let paddingRight = paddingRight {
        rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
      }
    }
    
    if let width = width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if let height = height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
  }
}
