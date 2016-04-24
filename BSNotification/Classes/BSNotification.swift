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
    case Top;
    case Bottom;
}

public class BSNotification: NSObject {
    
    public static func show(message: String, viewController: UIViewController) {
        BSNotification.show(message, viewController: viewController, position: BSNotificationPosition.Bottom)
    }
    
    public static func show(message: String, viewController: UIViewController, position: BSNotificationPosition) {
        let notificationView: UIView = UIView()
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        notificationView.layer.cornerRadius = 10
        notificationView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        viewController.view.addSubview(notificationView)
        
        if position == BSNotificationPosition.Top {
            viewController.view.addConstraint(NSLayoutConstraint(
                item: notificationView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: viewController.view,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: 50.0
                ))
        }
        else{
            viewController.view.addConstraint(NSLayoutConstraint(
                item: notificationView,
                attribute: NSLayoutAttribute.Bottom,
                relatedBy: NSLayoutRelation.Equal,
                toItem: viewController.view,
                attribute: NSLayoutAttribute.Bottom,
                multiplier: 1.0,
                constant: -30.0
                ))
        }
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0
            ))
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 24.0
            ))
        
        viewController.view.addConstraint(NSLayoutConstraint(
            item: notificationView,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: viewController.view,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -24.0
            ))
        
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.textColor = UIColor(white: 1, alpha: 1)
        messageLabel.font = UIFont(name: messageLabel.font.fontName, size: 12)
        notificationView.addSubview(messageLabel)
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: 8.0
            ))
        
        notificationView.addConstraint(NSLayoutConstraint(
            item: messageLabel,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: notificationView,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: -8.0
            ))
        
        notificationView.alpha = 0
        viewController.view.bringSubviewToFront(notificationView)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        notificationView.alpha = 1
        UIView.commitAnimations()
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(BSNotification.hide(_:)), userInfo: notificationView, repeats: false)
    }
    
    static func hide(timer: NSTimer) {
        if let BSNotificationView: UIView = timer.userInfo as? UIView {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            BSNotificationView.alpha = 0
            UIView.commitAnimations()
            NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(BSNotification.remove(_:)), userInfo: BSNotificationView, repeats: false)
        }
    }
    
    static func remove(timer: NSTimer) {
        if let BSNotificationView: UIView = timer.userInfo as? UIView {
            BSNotificationView.removeFromSuperview()
        }
    }
}
