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
    let hay = alfalfa.harvest()
    animal.eat(hay)
  }
}
