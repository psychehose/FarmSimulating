
import Foundation

let farm = Farm(animals: [
  Cow(isHungry: true),
  Cow(isHungry: false),
  Chicken(isHungry: true),
  Horse(isHungry: true)
])

farm.feedAnimals()


