//
//  NotificationViewController.swift
//  NotificationViewController
//
//  Created by Trainer on 28/08/20.
//  Copyright © 2020 Trainer. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
					label?.alpha = 0
    }
    
    func didReceive(_ notification: UNNotification) {
					self.label?.text = notification.request.content.title + " : " + notification.request.content.body
    }
	@IBAction func showButtonTapped(_ sender: UIButton) {
		UIView.animate(withDuration: 2) {
			self.label?.alpha = 1
			sender.alpha = 0
		}
	}
	
}
