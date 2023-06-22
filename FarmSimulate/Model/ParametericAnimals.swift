//
//  ParametericAnimals.swift
//  FarmSimulate
//
//  Created by 김호세 on 6/13/23.
//



import Foundation

// 다형성을 달성하는 방법 3. Parameteric

protocol AnimalFeed {
  associatedtype CropType: Crop where CropType.Feed == Self
  static func grow() -> CropType
}

protocol Crop {
  associatedtype Feed: AnimalFeed where Feed.CropType == Self
  func harvest() -> Feed
}

protocol Animal {
  associatedtype Feed: AnimalFeed
  func eat(_ food: Feed)
  var isHungry: Bool { get }
}



struct Cow: Animal {
  var isHungry: Bool
  func eat(_ food: Hay) {
    print("\(Self.self) eats \(food)")
  }
}

struct Horse: Animal {
  var isHungry: Bool

  func eat(_ food: Carrot) {
    print("\(Self.self) eats \(food)")
  }
}


struct Chicken: Animal {
  var isHungry: Bool

  func eat(_ food: Grain) {
    print("\(Self.self) eats \(food)")
  }
}

struct Farm {

  var animals: [any Animal]

  private func feed(_ animal: some Animal) {
    let crop = type(of: animal).Feed.grow()
    let food = crop.harvest()
    animal.eat(food)
  }

  func feedAnimals() {
    animals.filter(\.isHungry).map { animal in
      feed(animal)
    }
  }
}






// MARK: - Bad code

//  func feed(_ animal: Animal) {

//    if animal is Cow {
//      let alfalfa = Hay.grow()
//      let food = alfalfa.harvest()
//      animal.eat(food)
//
//      return
//    }
//
//    if animal is Horse {
//      let root = Carrot.grow()
//      let food = root.harvest()
//      animal.eat(food)
//
//      return
//    }
//
//    if animal is Chicken {
//      let wheat = Grain.grow()
//      let food = wheat.harvest()
//      animal.eat(food)
//
//      return
//    }

//  }




// 재료 -> 음식

// 소는 Alfalfa가 자라서 수확된 Hay를 먹음
// 말은 Root가 자라서 수확된 Carrot을 먹음
// 닭은 Wheat가 자라서 수확된 Grain을 먹음

struct Hay: AnimalFeed {
  static func grow() -> Alfalfa {
    return Alfalfa()
  }
}

struct Alfalfa: Crop {
  func harvest() -> Hay {
    return Hay()
  }
}

struct Carrot: AnimalFeed {
  static func grow() -> Root {
    return Root()
  }
}

struct Root: Crop {
  func harvest() -> Carrot {
    return Carrot()
  }
}


struct Grain: AnimalFeed {
  static func grow() -> Wheat {
    return Wheat()
  }
}

struct Wheat: Crop {
  func harvest() -> Grain {
    return Grain()
  }
}

