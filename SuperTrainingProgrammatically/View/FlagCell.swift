//
//  FlagCell.swift
//  SuperTrainingProgrammatically
//
//  Created by Stanislav Cherkasov on 2/20/20.
//  Copyright © 2020 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class FlagCell: UICollectionViewCell {
  
  let flagView: UIView = {
    let fView = UIView()
    
    return fView
  }()
  
  let flagImage: UIImageView = {
    let image = UIImageView()
    
    return image
  }()
  
  let flagImageName: UILabel = {
    let name = UILabel()
    name.textColor = .white
    name.textAlignment = .center
    name.font = UIFont.systemFont(ofSize: 12)
    
    return name
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(flagView)
    flagView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 110)
    
    flagView.addSubview(flagImage)
    flagImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, width: 100, height: 100)
    
    flagView.addSubview(flagImageName)
    flagImageName.anchor(top: flagImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 10)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
