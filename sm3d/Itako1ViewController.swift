//
//  Itako1ViewController.swift
//  sm3d
//
//  Created by kyasu on 2016/01/23.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import UIKit

class Itako1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

// MARK:- 3D Touch
    
    // プレビューアクションを登録
    override func previewActionItems() -> [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "Default", style: .Default) { (act, vc) -> Void in
            NSLog("action1 selected")
        }
        let action2 = UIPreviewAction(title: "Selected", style: .Selected) { (act, vc) -> Void in
            NSLog("action2 selected")
        }
        let action3 = UIPreviewAction(title: "Destructive", style: .Destructive) { (act, vc) -> Void in
            NSLog("action3 selected")
        }
        return [action1, action2, action3]
    }
}
