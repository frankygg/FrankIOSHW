//1
enum Gasoline {
    case gasoline92
    case gasoline95
    case gasoline98
    case desel
    func getPrice() -> Double {
        switch self {
        case .gasoline92: return 30.0
        case .gasoline95: return 31.0
        case .gasoline98: return 32.0
        case .desel: return 33.0
        }
    }
}

//2
class Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class People {
    var pet: Pet?
    init(_ pet: Pet?) {
        self.pet = pet
    }
}
//use  if let  to unwrap the  pet  property.
func hasPets(someOne: People) -> String {
    if let pet = someOne.pet  {
        return "This guys has a pet named \(pet.name)"
    }
    return "This guy doesn't have a pet!"
}
let firstPerson = People(nil)
let firstPersonStatus = hasPets(someOne: firstPerson)

//use  guard let  to unwrap the  pet  pro
func hasPets2(someOne: People) -> String {
    guard let pet = someOne.pet else {
        return "This guy doesn't have a pet!"
    }
    return "This guys has a pet named \(pet.name)"
}
let secondPerson = People(Pet(name: "Popo"))
let secondPersonStatus = hasPets2(someOne: secondPerson)


