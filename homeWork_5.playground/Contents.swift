import UIKit

//ДЗ:
//1. Создать enum с временами года.

enum partsOfYears {
    
    case summer
    case winter
    case autumn
    case spring
}

//2. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum
//с временем года этого месяца.


func getPartOfYears (month : Int) -> partsOfYears {
   
    switch month {
    case 3...5 : return partsOfYears.summer
    case 12,1,2 : return partsOfYears.winter
    case 9...11 : return partsOfYears.autumn
    case 6...8 : return partsOfYears.spring
    default : return partsOfYears.summer
    }
    
}
//3. Написать метод, который принимает variadic parameter String?. (или маасив опцианальных строк [String?]) Метод возвращает
//количество nil объектов и печатает в консоль одну строку всех объединенных не nil
//объектов.




func getNotNill (volumes : String?...) -> Int {
    
    var countNil = 0
    var oneWord : String = ""
    for x in volumes {
        if let word = x {
            oneWord.append(word + " ")
        } else {
            countNil += 1
        }
    }
    print(oneWord)
    return countNil
}


print("\(getNotNill(volumes: "ONe", nil, nil, nil, "end"))")




//4. Объявить опцианал, и сделать его разворачивание разными способами.

var zero : Int? = 1

// classic
if zero  != nil {
    print("Not nil!")
}

//if let

if let  empty = zero {
    zero = 1
}
else {print("\(zero ?? 0)")}

//guard let

func makeNill(num : Int?) {
    guard let zero = num else {
        print ("nil")
        return
    }
    print("\(num ?? 1)")
}

//force unwrap
print ("\(zero!)")

// nil - coalescing ??

print ("\(zero ?? 1)")

//optional chaining

var word : String? = nil
let takeInNum = word?.count


//if case let

if case let hasWord? = word {
    print("\(hasWord)")
}
else {print("Missed word")}



// unwrap into the Switch Case

switch word {
case .some(let value ):
    print("\(value)")
case .none: print("nil")
}
