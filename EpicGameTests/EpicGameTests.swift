//
//  EpicGameTests.swift
//  EpicGameTests
//
//  Created by Derrick Hathaway on 2/16/18.
//  Copyright © 2018 Derrick Hathaway. All rights reserved.
//

import XCTest
import Result
import ReactiveSwift
@testable import EpicGame

class EpicGameTests: XCTestCase {
  var observedScore: TestObserver<String, NoError>!
  let vm = ViewModel()
  
  override func setUp() {
    super.setUp()

    observedScore = vm.outputs.score.testObserver
  }
  
  func testScore() {
    vm.inputs.buttonTapped()
    observedScore.assertValues(["1"])
    
    vm.inputs.buttonTapped()
    observedScore.assertValues(["1", "2"])
    
    vm.inputs.buttonTapped()
    observedScore.assertValues(["1", "2", "3"])
  }
  
}

