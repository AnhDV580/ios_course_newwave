//
//  main.swift
//  exercise_1_2
//
//  Created by anhdv on 9/25/21.
//

import Foundation

while (true) {
    print("Hãy nhập 1 số nguyên dương không lớn hơn 10000: ")
    let number = readLine() ?? ""
    
    if (number.isInt) {
        if (Int(number)! > 10000) {
            print("\nBạn hãy nhập lại. Số trên lớn hơn 10000")
        } else {
            findRightDigit(number: Int(number) ?? 0)
            break
        }
    } else {
        print("\nBạn hãy nhập lại. Nội dung nhập không phải là 1 số nguyên dương")
    }
}


// MARK: Tìm chữ số phù hợp thỏa mãn điều kiện
// Chữ số lớn thứ nhì (hoặc lớn nhất nếu không có số lớn thứ nhì)
func findRightDigit(number: Int) -> Void {
    let rightDigit : Int
    
    // Mảng tát cả các chữ số trong số
    let digits : [Int] = String(number).compactMap { Int(String($0)) }
    
    // Mảng các chữ số đã loại bỏ trùng lặp và được sắp xếp từ lớn đến nhỏ
    let sortedUniqueDigits = Array(Set(digits)).sorted {
        $0 > $1
    }
    
    if sortedUniqueDigits.count > 1 {
        // Chữ số cần tìm là chữ số lớn thứ nhì
        rightDigit = sortedUniqueDigits[1]
        print("Số \(number) có chữ số lớn thứ nhì.")
        print("Chữ số lớn thứ nhì là: \(rightDigit)")
    } else {
        // Chữ số cần tìm là chữ số lớn thứ nhất (Do chỉ có 1 chữ số, không có số lớn thứ nhì)
        rightDigit = sortedUniqueDigits[0]
        print("Số \(number) không có chữ số lớn thứ nhì.")
        print("Chữ số lớn nhất là: \(rightDigit)")
    }
}


extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}


extension String  {
    var isInt: Bool {
        return Int(self) != nil
    }
}
