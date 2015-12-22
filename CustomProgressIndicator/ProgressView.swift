//
//  ProgressView.swift
//  CustomProgressIndicator
//
//  Created by Alexander Blokhin on 22.12.15.
//  Copyright © 2015 Alexander Blokhin. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    // the layer that shows the actual progress
    private let progressLayer = CAShapeLayer()
    
    private var progressLabel = UILabel()
    private var sizeProgressLabel = UILabel()
    
    // layer to show the dashed circle layer
    private var dashedLayer = CAShapeLayer()

    func createLabel() {
        progressLabel = UILabel()
        progressLabel.textColor = .whiteColor()
        progressLabel.textAlignment = .Center
        progressLabel.text = "0 %"
        progressLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40.0)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressLabel)
        // add constraints
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        
        // label to show the already downloaded size and the total size of the file
        sizeProgressLabel = UILabel()
        sizeProgressLabel.textColor = .whiteColor()
        sizeProgressLabel.textAlignment = .Center
        sizeProgressLabel.text = "0.0 MB / 0.0 MB"
        sizeProgressLabel.font = UIFont(name: "HelveticaNeue-Light", size: 10.0)
        sizeProgressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sizeProgressLabel)
        // add constraints
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: sizeProgressLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: progressLabel, attribute: .Bottom, relatedBy: .Equal, toItem: sizeProgressLabel, attribute: .Top, multiplier: 1.0, constant: -10.0))
    }
    

    private func createProgressLayer() {
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPointMake(CGRectGetWidth(frame)/2 , CGRectGetHeight(frame)/2)
        
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: CGRectGetWidth(frame)/2 - 10.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).CGPath
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.whiteColor().CGColor
        progressLayer.lineWidth = 4.0
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
        
        let dashedLayer = CAShapeLayer()
        dashedLayer.strokeColor = UIColor(white: 1.0, alpha: 0.5).CGColor
        dashedLayer.fillColor = nil
        dashedLayer.lineDashPattern = [2, 4]
        dashedLayer.lineJoin = "round"
        dashedLayer.lineWidth = 2.0
        dashedLayer.path = progressLayer.path
        layer.insertSublayer(dashedLayer, below: progressLayer)
    }
}






