//
//  Animals.swift
//  FarmSimulate
//
//  Created by 김호세 on 6/13/23.
//

import Foundation


struct Cow {
  func eat(_ food: Hay) { }
}

struct Hay {
  static func grow() -> Alfalfa {
    return Alfalfa()
  }
}

struct Alfalfa {
  func harvest() -> Hay {
    return Hay()
  }
}



struct Farm {
  func feed(_ animal: Cow) {
    let alfalfa = Hay.grow()
    // 소는 hay를 먹음
    let food = alfalfa.harvest()
    animal.eat(food)

    print("\(animal) eat \(food)")
  }
}


// 다양한 동물 추가

//struct Horse {
//  func eat(_ food: Carrort) { }
//}
//
//struct Chicken {
//  func eat(_ food: Grain) { }
//}
