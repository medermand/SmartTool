//
//  ViewController.swift
//  Ruler
//
//  Created by Meder on 12/05/15.
//  Copyright (c) 2015 Meder. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation
import QuartzCore





class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet var scroller: UIScrollView!
    var fixedAngle = 0.0
    var firstTime = true;
    var previousAngle = 0.0
    var newAngle = 0.0
    var previousAngleCheck = true// it is to get previous angle, in order to use newAngle and previousAngle difference for changing the coordinate system
    var differenceCheck = true//this one is to know whether previous and new angles' difference is greater or less than the value that I want
    var difference = 0.0
    var check350 = false
    var check_350 = false
    
    @IBOutlet var Label: UILabel!
    @IBOutlet var start: UIButton!
    
    @IBAction func startAngle(sender: AnyObject) {
        
        self.locationManager.startUpdatingHeading()
//        start.hidden = true

    }
   
    @IBAction func resetAngle(sender: AnyObject) {

        Label.text = "0.0"
        firstTime = true

    }
    
    let motionManager = CMMotionManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroller.userInteractionEnabled = true
        scroller.contentSize = CGSize(width: 320, height: 1257);
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.headingFilter = 1
        locationManager.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
//        println("Bul jakka kirip jatat")
        
        if !previousAngleCheck{
            previousAngle = newAngle;
            differenceCheck = false
        }
        
        previousAngleCheck = false
        
        newAngle  = newHeading.trueHeading
        Label.text = "\(newAngle)"
//        println(newAngle)
//        if firstTime{
//            fixedAngle = newAngle
//            firstTime = false
//        }
//        
//        
//        if !differenceCheck{
//            difference = newAngle - previousAngle
//        }
////        println(difference)
//
//        
//        if difference > 350{
//            check350 = true
//        }else if difference < -350{
//            check_350 = true
//        }else{
//            var labelDifference = newAngle - fixedAngle
//            
//            if labelDifference < 0 {
//                labelDifference = -1 * labelDifference
//            }
//            if check350{
//                labelDifference = fixedAngle + 360 - newAngle
//
//            }
//            if check_350{
//                labelDifference = 360 - fixedAngle + newAngle
//            }
//            
//            if labelDifference >= 360 {
//                check350 = false
//                check_350 = false
//                firstTime = true
//            }
//            let y = Double(round(labelDifference * 10)/10)
//            Label.text = "\(y)"
//        }
//    }
    }

}

extension Double {
    var degrees: Double {
        return self * 90.0
    }
}