//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Trainer on 28/08/20.
//  Copyright © 2020 Trainer. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

	let centre = UNUserNotificationCenter.current()

	@IBAction func startLocalNotification(_ sender: UIButton) {

		centre.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
			if granted{
				print("Notification allowed")
			}else{
				print("Notification denied")
			}
		}

		//scheduleNotification()

	}

	func scheduleNotification(){

		let content = UNMutableNotificationContent()
		content.title = "Wake up call"
		content.body = "The early bird catches the worm, but the second mouse gets the cheese."
		content.categoryIdentifier = "alarm"
		content.userInfo = ["customData": "wakeupcall"]
		content.sound = .default
		content.badge = 1

		var dateComponets = DateComponents()
		dateComponets.hour = 12
		dateComponets.minute = 51
		let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponets, repeats: false)

		//let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

		let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

		centre.add(request)

		print(UUID().uuidString)
	}

	@IBAction func showCustomNotification(_ sender: UIButton) {

		centre.getNotificationSettings { (settings) in
			guard settings.authorizationStatus == .authorized else {
				return
			}

			let content = UNMutableNotificationContent()
			content.categoryIdentifier = "NotificationViewController"

			content.title = "Time to wake up"
			content.subtitle = "It's too late"
			content.body = "One time alert to wake you up"
			content.sound = .default

			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

			let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

			self.centre.add(request, withCompletionHandler: nil)

		}


	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		let notifiactionCategory = UNNotificationCategory(identifier: "NotificationViewController", actions: [], intentIdentifiers: [], options: [])

		centre.setNotificationCategories([notifiactionCategory])

	}


}

