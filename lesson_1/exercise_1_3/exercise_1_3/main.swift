//
//  main.swift
//  exercise_1_3
//
//  Created by anhdv on 9/25/21.
//

import Foundation

print("Chương trình tính tiền cước taxi\n")

while (true) {
    print("Hãy nhập quãng đường đã di chuyển (km): ")
    let distanceTraveled = readLine() ?? ""
    
    if (distanceTraveled.isNumeric) {
        print("\nQuãng đường đã đi: \(distanceTraveled) km")
        
        let cost = calculateCost(distance: Double(distanceTraveled)?.toInt() ?? 0)
        print("Số tiền phải trả: \(cost) VND\n")
        
        break
    } else {
        print("\nBạn hãy nhập lại. Nội dung nhập không phải là 1 số")
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
    var isNumeric : Bool {
        return Double(self) != nil
    }
}

func calculateCost(distance: Int) -> Int {
    var cost : Int = 0

    for i in 0..<distance {
        if (i < 1) {
            cost += 5000
        } else if (i < 31) {
            cost += 4000
        } else {
            cost += 3000
        }
    }
    
    return cost
}
