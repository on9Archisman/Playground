import UIKit

/* Stored Properties */

class Person {
    var name: String = "abcd"
    var age: Int = 20
    let address: String = "xyz"
    
    init() {}
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var c1 = Person()
c1.name = "Archisman"
c1.age = 31
print("Name = \(c1.name) && Age = \(c1.age)")

let c2 = Person()
c2.name = "Moumita"
c2.age = 24
print("Name = \(c2.name) && Age = \(c2.age)")

var c3 = Person(name: "ASD", age: 20)
// c3.address = "dhjgdhjfdsghjsdghjsdghsjd"
// Cannot assign to property: 'address' is a 'let' constant
// We can modify the stored properties default values at the time of initializing class or structure
print("Name = \(c3.name) && Age = \(c3.age) && Address = \(c3.address)")

struct Person2 {
    var name: String = "abcd"
    var age: Int = 20
    let address: String = "xyz"
}

print("-----------------------------------")

var s1 = Person2()
s1.name = "Archisman"
s1.age = 31
print("Name = \(s1.name) && Age = \(s1.age)")

let s2 = Person2(name: "ABCD", age: 50)
// s2.address = ""
// Cannot assign to property: 'address' is a 'let' constant
// s2.name = ""
// Cannot assign to property: 's2' is a 'let' constant
print("Name = \(s2.name) && Age = \(s2.age) && Address = \(s2.address)")

struct Person3 {
    // Variable store property
    var name: String
    
    // Constant stored property
    let address: String
}

let s3 = Person3(name: "Anil", address: "Merry Park")
print("Name: \(s3.name) && Address: \(s3.address)")
// s3.address = ""
// Cannot assign to property: 'address' is a 'let' constant
// s3.name = "Anil Kumar Banerjee"
// Cannot assign to property: 's3' is a 'let' constant

var s4 = Person3(name: "Anil Kumar", address: "Merry Park")
print("Name: \(s4.name) && Address: \(s4.address)")
s4.name = "Banerjee"
print("Name: \(s4.name) && Address: \(s4.address)")


/* Lazy Stored Property */

class Example {
    var name: String?
    
    // Lazy closure stored property
    lazy var fullname: String = { [weak self] in
        guard let self = self, let name = self.name else { return "" }
        return name
    }()
    
    // Lazy stored property
    lazy var count = Int()
    
    init() {}
    
    init(name: String?) {
        self.name = name
    }
}

var c4 = Example()
c4.name = "QWERRTR"
c4.count = c4.fullname.count
print("Lazy Closure Example 1 = \(c4.fullname) && \(c4.count)")

var c5 = Example(name: "PLOIKMLOPL")
c5.count = c5.name?.count ?? 0
print("Lazy Closure Example 2 = \(c5.fullname) && \(c5.count)")

/* Computed Property */

struct rectangle {
    var length: Double
    var width: Double
    
    // Computed property
    var perimeter: Double {
        
        // Getter
        get {
            return 2 * (length + width) // return 2 * sum
        }
        
        // Setter
        set(newVaule) {
            length = (newVaule - width) / 2
        }
    }
    
    // Read only computed property
    var sum: Double {
        return length + width
    }
}

var s5 = rectangle(length: 10, width: 5)
// Accessing the computed property
print("Perimeter: \(s5.perimeter) && Sum: \(s5.sum)")
// Setting new value in the computed property
s5.perimeter = 45
print("Perimeter: \(s5.perimeter) && Sum: \(s5.sum) && Length: \(s5.length)")

/* Property Observer */

struct bag {
    var totalItem: Int = 0 {
        willSet(newValue) {
            print("\(newValue) items going to be added soon")
        }
        
        didSet {
            if totalItem == 0 || totalItem > oldValue {
                print("\(totalItem - oldValue) items added recently")
            } else {
                print("\(totalItem - oldValue) items removed recently")
            }
        }
    }
}

var s6 = bag()
s6.totalItem = 10
s6.totalItem = 3
s6.totalItem = 15
s6.totalItem = 20

/* Property Wrapper */
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {
            return number
        }
        
        set {
            number = min(newValue, 12)
        }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    
    private var _width = TwelveOrLess()
    var width: Int {
        get {
            _width.wrappedValue
        }
        
        set {
            _width.wrappedValue = newValue
        }
    }
}

var rect1 = SmallRectangle()
rect1.height = 5
print("Height = \(rect1.height)")
rect1.height = 29
print("Height = \(rect1.height)")
rect1.width = 7
print("Width = \(rect1.width)")
rect1.width = 30
print("Width = \(rect1.width)")

/* Type Property */

struct iOS {
    // Type property
    static var version = "iOS 10"
    static var plateform: String {
        return "iOS"
    }
    
    // Type method
    static func getVersion() {
        print(version)
    }
}

print(iOS.version)
iOS.getVersion()
iOS.version = "iOS 13"
iOS.getVersion()
print(iOS.plateform)
