//
//  ViewController.swift
//  exercise_2_3
//
//  Created by anhdv on 10/2/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var labelCurrentTime: UILabel!
    @IBOutlet weak var imageWatchFace: UIImageView!
    
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabelCurrentTime()
        
        drawCircle()
        drawCenterPoint()
        
        drawClockHands(rect: CGRect(x: (view.frame.width / 2), y: (view.frame.height / 2), width: 8.0, height: 40), type: .hour)
        drawClockHands(rect: CGRect(x: (view.frame.width / 2), y: (view.frame.height / 2), width: 4.0, height: 40), type: .minute)
        drawClockHands(rect: CGRect(x: (view.frame.width / 2), y: (view.frame.height / 2), width: 1.0, height: 40), type: .second)
    }

    func drawCircle() -> Void {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (view.frame.width / 2), y: (view.frame.height / 2)), radius: CGFloat(150), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 3.0
            
        view.layer.addSublayer(shapeLayer)
        
    }
    
    func drawCenterPoint() -> Void {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (view.frame.width / 2), y: (view.frame.height / 2)), radius: CGFloat(6), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 6.0
            
        view.layer.addSublayer(shapeLayer)
        
    }
    
    func drawClockHands(rect: CGRect, type: ClockHandType) {
        let aPath = UIBezierPath()

        aPath.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y))
        
        let (degree, scale) = getDegreeAndScale(fromDate: self.date, type: type)

        aPath.addLine(to: CGPoint(x: rect.origin.x + (scale * sin(degree)), y: rect.origin.y + (scale * cos(degree))))

        // If you want to stroke it with a red color
        UIColor.red.set()
        aPath.lineWidth = 6.0
        aPath.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = aPath.cgPath
        
        if (type == .second) {
            shapeLayer.fillColor = UIColor.red.cgColor
            shapeLayer.strokeColor = UIColor.red.cgColor
        } else {
            shapeLayer.fillColor = UIColor.gray.cgColor
            shapeLayer.strokeColor = UIColor.gray.cgColor
        }

        shapeLayer.lineWidth = rect.width
            
        view.layer.addSublayer(shapeLayer)
    }
    
    func getDegreeAndScale(fromDate: Date, type: ClockHandType) -> (degree: CGFloat, scale: CGFloat) {
        let calendar = Calendar.current
        let time = calendar.dateComponents([.hour,.minute,.second], from: fromDate)

        let degree : CGFloat
        let scale : CGFloat
        
        if (type == .second) {
            let currentSecond = CGFloat(time.second ?? 0)
            degree = currentSecond * (360 / 60)
            scale = 130.0
        } else if (type == .minute) {
            let currentMinute = CGFloat(time.minute ?? 0)
            degree = currentMinute * (360 / 60)
            scale = 90.0
        } else {
            let currentHour = CGFloat(time.hour ?? 0)
            degree = currentHour * (360 / 60)
            scale = 50.0
        }
        return (degree, scale)
    }
    
    func displayLabelCurrentTime() -> Void {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            self.date = Date()
            let currentTime = dateFormatter.string(from: self.date)
            self.labelCurrentTime.text = currentTime
        }
    }
    
    enum ClockHandType {
        case hour
        case minute
        case second
    }
}

