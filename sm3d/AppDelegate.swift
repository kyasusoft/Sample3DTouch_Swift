//
//  AppDelegate.swift
//  sm3d
//
//  Created by kyasu on 2016/01/23.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // 動的にショートカットアイテムを追加
        let item = UIApplicationShortcutItem.init(type: "com.kyasusoft.itako", localizedTitle: "イタコ姉さん", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(type: UIApplicationShortcutIconType.Location), userInfo: nil)
        
        UIApplication.sharedApplication().shortcutItems = [item]
        
        return true
    }

// MARK:- 3D Touch ショートカットアイテムから起動した時に呼ばれるdelegete

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        if shortcutItem.type == "com.kyasusoft.kiritan" {
            // きりたんのノーティフィケーションをポストする
            let n = NSNotification(name: "goKiritan", object: self)
            NSNotificationCenter.defaultCenter().postNotification(n)
        } else {
            // イタコ姉さんのノーティフィケーションのポストする
            let n = NSNotification(name: "goItako", object: self)
            NSNotificationCenter.defaultCenter().postNotification(n)
        }
        
        completionHandler(true)
    }
}

