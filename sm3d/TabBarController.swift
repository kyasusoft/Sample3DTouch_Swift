//
//  TabBarController.swift
//  sm3d
//
//  Created by kyasu on 2016/01/23.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // ショートカットアイテムから来た時のオブザーバー登録
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "kiritan", name: "goKiritan", object: nil)
        nc.addObserver(self, selector: "itako",   name: "goItako",   object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        // オブザーバー削除
        let nc = NSNotificationCenter.defaultCenter()
        nc.removeObserver(self)
    }

    // きりたんのタブを選択
    func kiritan() {
        self.selectedViewController = self.viewControllers![0]
    }

    // イタコ姉さんのタブを選択
    func itako() {
        self.selectedViewController = self.viewControllers![1]
    }
}
