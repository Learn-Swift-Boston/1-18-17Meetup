//
//  ViewController.swift
//  Calculator
//
//  Created by Matt Dias on 1/18/17.
//  Copyright © 2017 Zipcar. All rights reserved.
//

import UIKit

enum Operations: String {
	case plus = "+"
	case minus = "-"
}

class ViewController: UIViewController {

	@IBOutlet weak var resultLabel: UILabel!

	var result = 0 {
		didSet {
			resultLabel.text = "\(result)"
		}
	}

	var operation: Operations?
	var operands = [0]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		resultLabel.text = "\(result)"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func tappedNumber(_ sender: UIButton) {
		guard let text = resultLabel.text else {
			return
		}

		var resultText = text

		if text == "0" {
			resultLabel.text = ""
			resultText = ""
		}

		if resultText == "0" {
			resultLabel.text = ""
		}

		resultLabel.text = resultText + "\(sender.tag)"
	}

	@IBAction func plusTapped(_ sender: Any) {
		guard let resultText = resultLabel.text else {
			return
		}

		guard let operand = Int(resultText) else {
			return
		}
		operands.append(operand)

		resultLabel.text = resultText + " + "
		operation = .plus
	}
	
	@IBAction func equalTapped(_ sender: Any) {
		guard let operation = operation else {
			return
		}

		let test = resultLabel.text!.components(separatedBy: " + ").last!

		guard let operand = Int(test) else {
			return
		}

		operands.append(operand)

		switch operation {
		case .plus:
			operands.forEach({ (val) in
				result += val
			})
		default:
			return
		}
	}

}

