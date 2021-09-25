//
//  main.swift
//  exercise_1_1
//
//  Created by anhdv on 9/25/21.
//

import Foundation


while (true) {
    
    var inputDateTime : Date
    
    
    print("--------------------------------")
    print("Hãy nhập thời điểm T theo định dạng sau (Giờ: Phút: Giây): ")
    var dateTime = readLine()
    dateTime = dateTime?.trimmingCharacters(in: .whitespacesAndNewlines)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    
    if dateFormatter.date(from: dateTime!) != nil {
        // valid format
        print("Đã nhập đúng định dạng")
        
        inputDateTime = dateFormatter.date(from: dateTime!)!
    } else {
        print("Bạn hãy nhập lại. Không đúng định dạng Giờ: Phút: Giây")
        continue
    }
    
    
    print("Hãy nhập 1 số nguyên nhỏ hơn hoặc bằng 10000")
    var number = readLine() ?? ""
    number = number.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if (number.isInt) {
        if (Int(number)! > 10000) {
            print("\nBạn hãy nhập lại. Số trên lớn hơn 10000")
        } else {
            let afterDateTime = inputDateTime.addingTimeInterval(Double(number) ?? 0)
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "HH:mm:ss"
            
            print("Thời gian sau \(number) giây là \(dateFormatterPrint.string(from: afterDateTime))")
            break
        }
    } else {
        print("\nBạn hãy nhập lại. Số cần nhập phải là số nguyên nhỏ hơn hoặc bằng 10000")
    }
}


extension String  {
    var isInt: Bool {
        return Int(self) != nil
    }
}
