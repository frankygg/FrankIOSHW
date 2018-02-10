//Array
//1
var myFriends: [String] = []

//2
myFriends.append("Ian")
myFriends.append("Bomi")
myFriends.append("Kevin")

//3
myFriends.append("Michael")

//4
myFriends.insert("Kevin", at: 0)
myFriends.remove(at: 3)

//5
myFriends.forEach { friend in
    print(friend)
}

//6
//myFriends[5] => index out of range

//Dictionary
//1
var myCountryNumber = [String : Int]()

//2
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81

//3
myCountryNumber["US"] = nil

//4
myCountryNumber["GB"] = 0

//5
//find all keys
let myCountryNumberKeys = [String](myCountryNumber.keys)
//find all values
let myCountryNumberValues = [Int](myCountryNumber.values)

//For, While, Repeat
//1
for friend in myFriends {
    print(friend, terminator:" ")
}
print("")
//keys in myCountryNumber
for (key, _) in myCountryNumber {
    print(key, terminator: " ")
}
print("")
//values in myCountryNumber
for (_, value) in myCountryNumber {
    print(value, terminator: " ")
}
print("")

//2
let lottoNumbersarray = [10, 9, 8, 7, 6, 5]

for number in 3...5 {
    print(lottoNumbersarray[number])
}

//3
for number in stride(from: 5, to: -1, by: -1) {
    print(lottoNumbersarray[number])
}
for number in stride(from: 0, to: 5, by: 2) {
    print(lottoNumbersarray[number])
}
//4
var x = 5
while x >= 0 {
    print(lottoNumbersarray[x])
    x -= 1
}
var y = 0
while y <= 4 {
    print(lottoNumbersarray[y])
    y += 2
}


//5
x = 5
repeat {
    print(lottoNumbersarray[x])
    x -= 1
} while x >= 0
y = 0
repeat {
    print(lottoNumbersarray[y])
    y += 2
} while y < 6

//if statement
var isRaining = false
if isRaining {
    print("It’s raining, I don’t want to work today.")
} else {
    print("Althoughit’s sunny, I still don’t want to work today.")
}

//Switch
var jobLevel = 4
switch jobLevel {
case 1 : print("Member")
case 2 : print("Team Leader")
case 3 : print("Manager")
case 4 : print("Director")
default : print("We don't have this job")
}








