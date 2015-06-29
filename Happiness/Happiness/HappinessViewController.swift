//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Joanne Koong on 6/29/15.
//  Copyright (c) 2015 joanne. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    var happiness: Int = 100 {
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50) / 50
        
    }
}

// how to hook up UI to model (via controller)  
// is this model or controller???