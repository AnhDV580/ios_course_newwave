//
//  main.swift
//  exercise_2_1
//
//  Created by anhdv on 10/2/21.
//

import Foundation

var randomNumber: Int?

while true {
    print("Please input number from 1 to 100 ")
    let imput = readLine() ?? ""
    
    if (imput.isInt) {
        playMiniGame(number: Int(imput) ?? 0)
    } else {
        continue
    }
}

extension String  {
    var isInt: Bool {
        return Int(self) != nil
    }
}

func playMiniGame(number: Int) -> Void {
    
    let randomNumber = Int.random(in: 1...100)
    
    if (number == randomNumber) {
        print("Congratulation!!! Your input number \(number) is equal to random number \(randomNumber)")
    } else if (number < randomNumber) {
        print("Sorry! Your input number \(number) is less than random number \(randomNumber)")
    } else {
        print("Sorry! Your input number \(number) is greater than random number \(randomNumber)")
    }
    
}
