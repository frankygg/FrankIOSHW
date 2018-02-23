//1
struct Person: PoliceMan{
    var name: String
    var toolMan: ToolMan
    func arrestCriminals() {
        print("\(name) arrested a criminal")
    }
}

protocol PoliceMan {
    func arrestCriminals()
}

protocol ToolMan {
    func fixComputer()
}

struct Engineer: ToolMan {
    func fixComputer() {
        print("I am a tool man")
    }
}

let engineer = Engineer()
let somePerson = Person(name: "Steven", toolMan: engineer)
somePerson.arrestCriminals()
somePerson.toolMan.fixComputer()
