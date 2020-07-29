//
//  tbVC.swift
//  customeTabbar
//
//  Created by mac on 29/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class tbVC: UITabBarController {
    
    var secondItemImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.tabBar.gradientBackground2()
        print("hello")
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
//        if secondItemImageView != nil{
//            let rotate = CABasicAnimation(keyPath: "transform.rotation")
//            rotate.fromValue = CGFloat.pi*2
//            rotate.toValue = 0
//            rotate.duration = 0.6
//            rotate.isRemovedOnCompletion = false
//            secondItemImageView.layer.add(rotate, forKey: "transform.rotation")
//        }
        
        if let view:UIView = item.value(forKey: "view") as? UIView {
            if let currentImageView = view.subviews.compactMap({ $0 as? UIImageView }).first {
                
                let rotate = CABasicAnimation(keyPath: "transform.rotation")
                rotate.fromValue = -CGFloat.pi*2
                rotate.toValue = 0
                rotate.duration = 0.6
                rotate.isRemovedOnCompletion = false
                currentImageView.layer.add(rotate, forKey: "transform.rotation")
                //secondItemImageView = currentImageView
            }
        }
    }
}


extension UIView {
    func gradientBackground2(){
        let gradient = CAGradientLayer()
        gradient.frame = layer.bounds
        gradient.frame.size.height = layer.frame.height + 50
        let leftColor = UIColor(red:236.0/255.0, green:90.0/255.0, blue:110.0/255.0, alpha:1.0)
        let rightColor = UIColor(red:244.0/255.0, green:154.0/255.0, blue:24.0/255.0, alpha:1.0)
        gradient.colors = [leftColor.cgColor, rightColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
    }
    
}
