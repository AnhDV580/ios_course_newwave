//
//  main.swift
//  exercise_1_5
//
//  Created by anhdv on 9/25/21.
//

import Foundation

print("Các số Armstrong nhỏ hơn 1000 là: ")


findArmstrongNumberLessThan1000()


// MARK: Tính x lũy thừa y (x^y)
func power(x: Int, y: Int) -> Int {
    
    // Nếu số mũ bằng 0
    if (y == 0) {
        return 1
    }

    // Nếu số mũ chẵn hoặc lẻ
    if (y % 2 == 0) {
        return power(x: x, y: y/2) * power(x: x, y: y/2)
    } else {
        return x * power(x: x, y: y/2) * power(x: x, y: y/2)
    }
}


// MARK: Tính bậc của số
func order(number: Int) -> Int {
    var n = 0
    var temp = number

    while (temp != 0) {
        n += 1
        temp = temp/10
    }

    return n
}


// MARK: Kiểm tra xem số này có phải số Armstrong hay không
func isArmstrongNumber(number: Int) -> Bool {
    
    let exponent = order(number: number)
    var temp = number
    var sum = 0

    while (temp != 0) {
        let base = temp % 10
        sum = sum + power(x: base, y: exponent) // base: cơ số, exponent: số mũ
        temp = temp/10
    }

    // If satisfies Armstrong condition
    return (sum == number);
}


// MARK: In các số Amstrong nhỏ hơn 1000
func findArmstrongNumberLessThan1000() -> Void {
    for index in 0..<1000 {
        if (isArmstrongNumber(number: index)) {
            print(index, terminator: ", ")
        }
    }
    print("")
}
