//
//  CoinCell.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/21/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

protocol CoinsCellDelegate {
  
  func coinCell(_ cell: CoinCell, with index:Int)
}

class CoinCell: UICollectionViewCell {
  
  let coinView: UIView = {
    let fView = UIView()
    
    return fView
  }()
  
  let coinImage: UIImageView = {
    let image = UIImageView()
    image.layer.cornerRadius = image.layer.frame.width / 2
    image.clipsToBounds = true
    image.layer.backgroundColor = UIColor.black.cgColor
    
    image.contentMode = ContentMode.scaleAspectFit
    
    return image
  }()
  
  let coinImageName: UILabel = {
    let name = UILabel()
    name.textColor = .white
    name.textAlignment = .center
    name.font = UIFont.systemFont(ofSize: 12)
    
    return name
  }()
  
  var index: Int!
  var delegate: CoinsCellDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(coinView)
    coinView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
    
    coinView.addSubview(coinImage)
    coinImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, width: 100, height: 100)
    
    addSubview(coinImageName)
    coinImageName.anchor(top: coinImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 10)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
