//
//  KiritanViewController.swift
//  sm3d
//
//  Created by kyasu on 2016/01/23.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import UIKit

class KiritanViewController: UIViewController {

    @IBOutlet weak var kiritanImageView: UIImageView!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 3Dタッチの圧力
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // イメージの透明度変更（iOS 9以降でforceTouch有り）
        if atof(UIDevice.currentDevice().systemVersion) >= 9.0 {
            if self.traitCollection.forceTouchCapability == .Available {
                let force = touches.first?.force
                let max   = touches.first?.maximumPossibleForce
                // 押した時に透明度を下げる
                kiritanImageView.alpha = 1.0 - force! / max!
                
                maxLabel.text   = String(format:"%0.2f", max!)
                forceLabel.text = String(format:"%0.2f", force!)
            }
        }
    }
}
