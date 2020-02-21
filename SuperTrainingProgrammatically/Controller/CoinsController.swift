//
//  CoinsController.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/21/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

private let headerIdentifier = "HeaderIdentifier"
private var coinCellIdetifier = "CoinCellIdentifier"

class CoinsController: UICollectionViewController {
  
  var coinStore = CoinStore()
  var selectedCountry: Country?
  
  lazy var conteinerView: UIView = {
    let topView = UIView()
    topView.backgroundColor = .black
    
    return topView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.addSubview(conteinerView)
      conteinerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: view.frame.height * 0.3)
      collectionView.backgroundColor = .black
      self.coinStore.loadCoins()
      self.coinStore.filterCoins(with: selectedCountry!)
      collectionView.register(CoinCell.self, forCellWithReuseIdentifier: coinCellIdetifier)
      collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
      collectionView.contentInsetAdjustmentBehavior = .never
    }

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.coinStore.coins.count + 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: coinCellIdetifier, for: indexPath)
      as! CoinCell
    cell.index = indexPath.row
    
    if indexPath.row < self.coinStore.coins.count {
      cell.coinImageName.text = self.coinStore.coins[indexPath.row].name
      
      let image = UIImage(named: self.coinStore.coins[indexPath.row].image)
      cell.coinImage.image = image
      
      cell.delegate = self as? CoinsCellDelegate
    } else {
      if indexPath.row == self.coinStore.coins.count {
        cell.coinImageName.text = selectedCountry?.name
        
        let image = UIImage(named: (selectedCountry?.flagImageName)!)
        cell.coinImage.image = image
      }
    }
    return cell
  }

}

extension CoinsController {
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
    return header
  }
}

extension CoinsController: UICollectionViewDelegateFlowLayout {
  
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
