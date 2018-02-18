//: Playground - noun: a place where people can play

import UIKit

// Reactive Swift which is based on the RX concept from the
// .net world is based on 2 core concepts:
//
// - Events: which are just that, events. Here's how they
//           are declared in ReactiveSwift:

enum Event {
  case value(Value)
  case failed(Error)
  case completed
  case interrupted
}


// - Observer: an object that responds to events

final class Observer {
  func send(value: Value)
  func send(error: Error)
  func sendCompleted()
  func sendInterrupted()
}

// In practice you won't typically deal with `Observer` much.
// For example, when you call `observeValues()` on a signal,
// under the hood, ReactiveSwift will create the observer for
// you. But if you
