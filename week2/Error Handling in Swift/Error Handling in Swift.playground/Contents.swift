class GuessNumerGame {
    
    var targetNumber = 10
    
    func guess(number: Int) throws {
        
    guard number == targetNumber else {
        
        throw GuessNumberGameError.wrongNumber
    }
    print("Guess the right number:  \(targetNumber) ")
    }
}
enum GuessNumberGameError: Error {
    case wrongNumber
}

let someNumber = GuessNumerGame()

do{
    try someNumber.guess(number: 20)
    
} catch GuessNumberGameError.wrongNumber {
print("Wrong number!")
}
