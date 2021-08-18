//
//  ViewController.swift
//  TestSentiment
//
//  Created by Trainer on 06/10/20.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {

	@IBOutlet weak var inputText: UITextField!
	@IBOutlet weak var outputLabel: UILabel!

	@IBAction func analyze(_ sender: UIButton) {
		let model = MyTextClassifier()
		let predict = try? model.prediction(text: inputText.text ?? "")
		outputLabel.text = predict?.label ?? "neutral"
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

