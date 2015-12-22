//
//  DownloadButton.swift
//  CustomProgressIndicator
//
//  Created by Alexander Blokhin on 22.12.15.
//  Copyright © 2015 Alexander Blokhin. All rights reserved.
//

import UIKit

class DownloadButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.whiteColor().CGColor
            
        layer.cornerRadius = 8.0
            
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
    }
}
