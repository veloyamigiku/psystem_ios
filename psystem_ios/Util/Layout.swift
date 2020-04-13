//
//  Layout.swift
//  psystem_ios
//
//  Created by velo.yamigiku on 2020/04/09.
//

import UIKit

class Layout: NSObject {
    
    /*
    制約(NSLayoutConstraint)を生成する。
    - parameter item: 制約を追加するオブジェクト。
    - parameter attr: 制約を追加するオブジェクトに与える属性。
    - parameter to: 制約の相手。
    - parameter attrTo: 制約相手に使用する属性。
    - parameter constant: 定数値。
    - parameter multiplier: 乗数値。
    - parameter relate: 計算式の関係性
    - parameter priority: 制約の優先度
    - returns: 制約(NSLayoutConstraint)オブジェクト
    */
    static public func constraint(
        item: AnyObject,
        _ attr: NSLayoutConstraint.Attribute,
        to: AnyObject?,
        _ attrTo: NSLayoutConstraint.Attribute,
        constant: CGFloat = 0.0,
        multiplier: CGFloat = 1.0,
        relate: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = UILayoutPriority.required) -> NSLayoutConstraint {
        
        let ret = NSLayoutConstraint(
            item:       item,
            attribute:  attr,
            relatedBy:  relate,
            toItem:     to,
            attribute:  attrTo,
            multiplier: multiplier,
            constant:   constant
        )
        ret.priority = priority
        return ret
        
    }
    
}
