//
//  ViewModel.swift
//  EpicGame
//
//  Created by Derrick Hathaway on 2/16/18.
//  Copyright © 2018 Derrick Hathaway. All rights reserved.
//

import Foundation
import Result
import ReactiveSwift

protocol ViewModelInputs {
  func buttonTapped()
}

protocol viewModelOutputs {
  var emoji: Signal<String, NoError> { get }
  var score: Signal<String, NoError> { get }
}

protocol ViewModelType {
  var inputs: ViewModelInputs { get }
  var outputs: viewModelOutputs { get }
}

final class ViewModel: ViewModelType, ViewModelInputs, viewModelOutputs {
  
  let buttonTappedProperty = MutableProperty<()>(())
  let score: Signal<String, NoError>
  let emoji: Signal<String, NoError>
  
  init() {
    let sumOfTaps = buttonTappedProperty.signal
      .scan(0) { score, _ in score + 1 }
    
    score = sumOfTaps
      .map { "\($0)" }
    
    emoji = sumOfTaps
      .map(emoji(forScore:))
  }
  
  func buttonTapped() {
    buttonTappedProperty.value = ()
  }
  
  var inputs: ViewModelInputs { return self }
  var outputs: viewModelOutputs { return self }
}

func emoji(forScore score: Int) -> String {
  switch score {
  case 0...3:
    return "😀"
  case 4...6:
    return "😐"
  default:
    return "😡"
  }
}
