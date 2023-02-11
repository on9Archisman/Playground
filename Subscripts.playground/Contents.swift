import UIKit

struct exampleOne {
    let value: Int
    
    subscript(index: Int) -> Double {
        return Double(value) / Double(index)
    }
}

let objOne = exampleOne(value: 100)
print(objOne[2])
print(objOne[3])
print(objOne[9])
print(objOne[5])
print(objOne[40])

struct exampleTwo {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday"]
    
    subscript(index: Int) -> String {
        get {
            return "Index = \(index) && \(days[index])"
        }
        
        set {
            // Where and how to USE??????? DOUBTFUL
            days[index] = newValue
        }
    }
}

var objTwo = exampleTwo()
print(objTwo[2])
// objTwo[0] = objTwo[2]
print(objTwo[0])
