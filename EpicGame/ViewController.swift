//
//  ViewController.swift
//  EpicGame
//
//  Created by Derrick Hathaway on 2/16/18.
//  Copyright © 2018 Derrick Hathaway. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class ViewController: UIViewController {
  let vm: ViewModelType = ViewModel()
  
  @IBOutlet weak var outputButton: UIButton!
  @IBOutlet weak var scoreLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    outputButton.reactive.title <~ vm.outputs.emoji
    scoreLabel.reactive.text <~ vm.outputs.score
  }

  @IBAction func dontTouch(_ sender: Any) {
    vm.inputs.buttonTapped()
  }
}

