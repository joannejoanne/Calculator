//
//  FaceView.swift
//  Happiness
//
//  Created by Joanne Koong on 6/29/15.
//  Copyright (c) 2015 joanne. All rights reserved.
//

import UIKit

class FaceView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
 
    var lineWidth: CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var color: UIColor = UIColor.blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var faceCenter: CGPoint {
        return convertPoint(center, fromView: superview)
    }
    
    var faceRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2
    }
    
    override func drawRect(rect: CGRect) {
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        facePath.lineWidth = lineWidth
        color.set()
        facePath.stroke()
    }

}
