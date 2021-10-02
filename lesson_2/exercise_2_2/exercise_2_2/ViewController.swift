//
//  ViewController.swift
//  exercise_2_2
//
//  Created by anhdv on 10/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonChangeImage: UIButton!
    @IBOutlet weak var imageName: UILabel!
    
    var listImageName: [String] = []
    var currentNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        displayImage()
    }

    @IBAction func changeImage(_ sender: Any) {
        currentNumber = getRandomNumber()
        displayImage()
    }
    
    func getRandomNumber() -> Int {
        return Int.random(in: 0...(listImageName.count - 1), excluding: currentNumber)
    }
    
    func initData() -> Void {
        listImageName = ["Image 1", "Image 2", "Image 3", "Image 4", "Image 5", "Image 6", "Image 7"]
    }
    
    func displayImage() -> Void {
        let image = UIImage(named: listImageName[currentNumber])
        imageName.text = listImageName[currentNumber]
        imageView.image = image
    }
}

extension Int {
    static func random(in range: ClosedRange<Int>, excluding x: Int) -> Int {
        if range.contains(x) {
            let r = Int.random(in: Range(uncheckedBounds: (range.lowerBound, range.upperBound)))
            return r == x ? range.upperBound : r
        } else {
            return Int.random(in: range)
        }
    }
}
