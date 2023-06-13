//
//  SubTypeAnimals.swift
//  FarmSimulate
//
//  Created by 김호세 on 6/13/23.
//


import Foundation

// 다형성을 달성하는 방법 2. Subtype

class Animal {
  func eat(_ food: Any) { fatalError(" Subclass implements 'eat' ") }
}


class Cow: Animal {
  override func eat(_ food: Any) {
    guard let food = food as? Hay else { fatalError("소는 \(food) 를 먹을 수 없습니다.") }
  }
}

class Horse: Animal {
  override func eat(_ food: Any) {
    guard let food = food as? Carrot else { fatalError("말은 \(food) 를 먹을 수 없습니다.") }
  }

}

class Chicken: Animal {
  override func eat(_ food: Any) {
    guard let food = food as? Grain else { fatalError("닭은 \(food) 를 먹을 수 없습니다.") }
  }
}


struct Farm {
  func feed(_ animal: Cow) {
    let alfalfa = Hay.grow()
    let food = alfalfa.harvest()
    animal.eat(food)

    print("\(animal) eat \(food)")
  }

  func feed(_ animal: Horse) {
    let root = Carrot.grow()
    let food = root.harvest()
    animal.eat(food)

    print("\(animal) eat \(food)")
  }

  func feed(_ animal: Chicken) {
    let wheat = Grain.grow()
    let food = wheat.harvest()
    animal.eat(food)

    print("\(animal) eat \(food)")
  }
}



// 재료 -> 음식

// 소는 Alfalfa가 자라서 수확된 Hay를 먹음
// 말은 Root가 자라서 수확된 Carrot을 먹음
// 닭은 Wheat가 자라서 수확된 Grain을 먹음


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

struct Carrot {
  static func grow() -> Root {
    return Root()
  }
}

struct Root {
  func harvest() -> Carrot {
    return Carrot()
  }
}


struct Grain {
  static func grow() -> Wheat {
    return Wheat()
  }
}

struct Wheat {
  func harvest() -> Grain {
    return Grain()
  }
}

