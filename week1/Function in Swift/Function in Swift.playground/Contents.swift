//1
func greet(person : String) -> String {
    return "Hello, " + person
}
greet(person: "Celeste")

//2
func multiply(a:Int, b:Int = 10) {
    print(a * b)
}
multiply(a:2, b:4)
multiply(a:2)


