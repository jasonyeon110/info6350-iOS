import UIKit

var greeting = "Hello, playground"
//String? is optional type of String
var whatTHe : String? = nil
greeting = "updating?"
let g2 = "hello"

var myInt = 10

myInt = 5 + myInt
 
var maxInt = Int.max

let minInt = Int.min

print("max Int value = \(maxInt)  and Min Int value = " + String(minInt))

let firstName = "Jason"
let lastName = "Yeon"

print(firstName + lastName)

let one = 1
let two = 2


if whatTHe == nil {
    print("correct")
} else{
    print("not right")
}


//functions
func noArgFunc(){
    print("hello jkgu")
}

noArgFunc()

func withArgFung (name: String, age: Int, m :Bool){
    print("name is \(name) and age is \(age) and m is \(m)")
}

var mybool = true
var myString: String = "w"

withArgFung(name: myString, age: 2, m: mybool)

var nums = [1,2,3,4,5,6,7]

for num in nums {
    print(num)
}

var strOptional: String?
var intOPtional: Int?


if let strVal = strOptional{
        withArgFung(name: strVal, age: myInt, m: mybool)
}

//***************A good way to right a function********************
//                  _ this underscore makes the function doesn't require passing str, iVal when you are
//                      actually using it . => //testingGuardVal(firstName, intOPtional)
func testingGuardVal(str: String?, iVal: Int?){
    //guard is better than the let if becuase your passing variable will be available in the whole block instead of
    //just within the function!!
    guard let strVal = str, let intVal = iVal else {
        print("String or Int Value passed was Null")
        return}
//    guard let intVal = iVal else {
//        print("int Value passed was Null")
//        return}
    
    withArgFung(name: strVal, age: intVal, m: true)
}

//testingGuardVal(str: firstName, iVal: 10000)


func funcwithReturnValue(_ str: String?, iVal: Int?) -> String{
    guard let strVal = str, let intVal = iVal else {
        print("String or Int Value passed was Null")
        return "error Values passed"
    }
    
    if intVal > 100 {
        return "value is greater than 100"
    }
    return "Integer Value is less than 100"
}


print(funcwithReturnValue(myString, iVal: 23))



//for loop

//for (int i = 0; i < 10; i ++ ){
//    codes
//}

//for i in 0..<4{
//    print("Value of i = \(i)")
//}

let arr = ["a", "b", "c", "d"]

//write a blank array
let blankArr : [String] = []
var blankInt : [Int] = []

blankInt.append(2)
blankInt.remove(at: 0)
print(blankInt)

for i in 0..<arr.count{
    print("letter = \(arr[i])")
}

for name in arr.reversed() {
    print(name)
}

