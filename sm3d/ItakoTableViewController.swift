//
//  ItakoTableViewController
//  sm3d
//
//  Created by kyasu on 2016/01/23.
//  Copyright © 2016年 kyasu. All rights reserved.
//

import UIKit

class ItakoTableViewController: UITableViewController, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var cell0: UITableViewCell!
    @IBOutlet weak var cell1: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 3D Touchに反応するビューを登録（iOS 9以降でforceTouch有り）
        if atof(UIDevice.currentDevice().systemVersion) >= 9.0 {
            if traitCollection.forceTouchCapability == .Available {
                // 1番目のcellを登録
                registerForPreviewingWithDelegate(self, sourceView: cell0)
                // 2番目のcellを登録
                registerForPreviewingWithDelegate(self, sourceView: cell1)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK:- 3D Touch delegate
    
    // 3D Touch peek（peekで表示するViewControllerを返却する）
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        if let indexPath = tableView.indexPathForRowAtPoint(location) {
            // タッチしたcellのrectを設定する
            previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)
        }
        // イタコ１かイタコ２のviewControllerを返却する
        if previewingContext.sourceView == cell0 {
            return self.storyboard!.instantiateViewControllerWithIdentifier("view0")
        } else {
            return self.storyboard!.instantiateViewControllerWithIdentifier("view1")
        }
    }

    // 3D Touch pop（pop先のViewControllerに遷移する）
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {

        self.navigationController?.pushViewController(viewControllerToCommit, animated:true)
        
        // イタコ１かイタコ２の詳細画面に遷移する
//        if previewingContext.sourceView == cell0 {
//            performSegueWithIdentifier("showView0", sender:nil)
//        } else {
//            performSegueWithIdentifier("showView1", sender:nil)
//        }
    }
}
