//
//  CustomControls.swift
//  rappi
//
//  Created by Francisco Ocampo Romero on 17/02/16.
//  Copyright © 2016 coldhandslabs. All rights reserved.
//

import UIKit

class CustomImage : UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.cornerRadius = 15
    layer.shadowOpacity = 5.0
    layer.shadowColor = UIColor.grayColor().CGColor
    layer.shadowRadius = 15
    layer.shadowOffset = CGSize(width: 10, height: 10)
    clipsToBounds = true
  }

}