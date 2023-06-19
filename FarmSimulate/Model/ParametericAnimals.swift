////
////  ParametericAnimals.swift
////  FarmSimulate
////
////  Created by 김호세 on 6/13/23.
////
//
//
//
//import Foundation
//
//// 다형성을 달성하는 방법 3. Parameteric
//
//
//protocol AnimalFeed {
//  associatedtype CropType: Crop where CropType.Feed == Self
//  static func grow() -> CropType
//}
//
//protocol Crop {
//  associatedtype Feed: AnimalFeed where Feed.CropType == Self
//  func harvest() -> Feed
//}
//
//protocol Animal {
//  associatedtype Feed: AnimalFeed
//  func eat(_ food: Feed)
//}
//
//
//struct Cow: Animal {
//  func eat(_ food: Hay) {
//  }
//}
//
//struct Horse: Animal {
//  func eat(_ food: Carrot) {
//
//  }
//
//}
//
//struct Chicken: Animal {
//  func eat(_ food: Grain) {
//
//  }
//}
//
//
//struct Farm {
//  func feed(_ animal: Cow) {
//    let alfalfa = Hay.grow()
//    let food = alfalfa.harvest()
//    animal.eat(food)
//
//    print("\(animal) eat \(food)")
//  }
//
//  func feed(_ animal: Horse) {
//    let root = Carrot.grow()
//    let food = root.harvest()
//    animal.eat(food)
//
//    print("\(animal) eat \(food)")
//  }
//
//  func feed(_ animal: Chicken) {
//    let wheat = Grain.grow()
//    let food = wheat.harvest()
//    animal.eat(food)
//
//    print("\(animal) eat \(food)")
//  }
//}
//
//
//
//// 재료 -> 음식
//
//// 소는 Alfalfa가 자라서 수확된 Hay를 먹음
//// 말은 Root가 자라서 수확된 Carrot을 먹음
//// 닭은 Wheat가 자라서 수확된 Grain을 먹음
//
//
//struct Hay {
//  static func grow() -> Alfalfa {
//    return Alfalfa()
//  }
//}
//
//struct Alfalfa {
//  func harvest() -> Hay {
//    return Hay()
//  }
//}
//
//struct Carrot {
//  static func grow() -> Root {
//    return Root()
//  }
//}
//
//struct Root {
//  func harvest() -> Carrot {
//    return Carrot()
//  }
//}
//
//
//struct Grain {
//  static func grow() -> Wheat {
//    return Wheat()
//  }
//}
//
//struct Wheat {
//  func harvest() -> Grain {
//    return Grain()
//  }
//}
//
