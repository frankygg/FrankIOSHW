//1
class Animal {
    var gender: Gender
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
    enum Gender {
        case male
        case female
        case undefined
    }
}
var dog = Animal(gender: .undefined)
dog.eat()

//2
class Elephant: Animal {

    override func eat() {
        print("I am vegetarian!")
    }
}
class Tiger: Animal {
    override func eat() {
        print("I eat meat!")
    }
}
class Horse: Animal {
    override func eat() {
        print("I eat grass!")
    }
}

//3
class Zoo {
    var weeklyHot: Animal
    
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}
let tiger = Tiger(gender: .undefined)
let elephant = Elephant(gender: .female)
let horse = Horse(gender: .male)

let zoo = Zoo(weeklyHot: horse)
zoo.weeklyHot = tiger
zoo.weeklyHot = horse
zoo.weeklyHot = elephant














