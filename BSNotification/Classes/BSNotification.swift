//
//  BSNotification.swift
//
//  Created by Bobby Stenly (iceman.bsi@gmail.com) on 6/27/15.
//  Copyright (c) 2015 Bobby Stenly Irawan. All rights reserved.
//
//
//  This Class is used to show a message for 5 seconds only
//

import UIKit

public enum BSNotificationPosition {
    case top;
    case bottom;
}

open class BSNotification: NSObject {
    
    open static func show(_ message: String, viewController: UIViewController) {
        BSNotification.show(message, viewController: viewController, position: BSNotificationPosition.bottom)
    }
    
    open static func show(_ message: String, viewController: UIViewController, position: BSNotificationPosition) {
        let notificationView: UIView = UIView()
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        notificationView.layer.cornerRadius = 10
        notificationView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        viewController.view.addSubview(notificationView)
        
        if position == BSNotificationPosition.top {
            viewController.view.addConstraint(NSLayoutConstraint(
                item: notificationView,
                attribute: NSLayoutAttribute.top,
                relatedBy: NSLayoutRelation.equal,
                toItem: viewController.view,
                attribute: NSLayoutAttribute.top,
                multiplier: 1.0,
                constant: 50.0
                ))
        }
        else{
            viewController.view.addConstraint(NSLayoutConstraint(
                item: notificationView,
                attribute: NSLayoutAttribute.bottom,
                relatedBy: NSLayoutRelation.equal,
                toItem: viewController.view,
                attribute: NSLayoutAttribute.bottom,
                multiplier: 1.0,
                constant: -30.0
                ))
        }
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1.0,
            constant: 0.0
            ))
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.greaterThanOrEqual,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: 24.0
            ))
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.lessThanOrEqual,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: -24.0
            ))
        
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.textColor = UIColor(white: 1, alpha: 1)
        messageLabel.font = UIFont(name: messageLabel.font.fontName, size: 12)
        notificationView.addSubview(messageLabel)
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.top,
            multiplier: 1.0,
            constant: 8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
            constant: -8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1.0,
            constant: 8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1.0,
            constant: -8.0
            ))
        
        notificationView.alpha = 0
        viewController.view.bringSubview(toFront: notificationView)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        notificationView.alpha = 1
        UIView.commitAnimations()
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(BSNotification.hide(_:)), userInfo: notificationView, repeats: false)
    }
    
    static func hide(_ timer: Timer) {
        if let BSNotificationView: UIView = timer.userInfo as? UIView {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            BSNotificationView.alpha = 0
            UIView.commitAnimations()
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(BSNotification.remove(_:)), userInfo: BSNotificationView, repeats: false)
        }
    }
    
    static func remove(_ timer: Timer) {
        if let BSNotificationView: UIView = timer.userInfo as? UIView {
            BSNotificationView.removeFromSuperview()
        }
    }
}
