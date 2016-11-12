//
//  ViewController.swift
//  OnePunchApp
//
//  Created by Paul Mun on 11/11/16.
//  Copyright © 2016 Team No Shoes. All rights reserved.
//

import UIKit
import CoreMotion

class SpeedPunchViewController: UIViewController {
    var counter: Int = 0
    var punching: Bool = false
    var punchStartStop: Int = 0
    
    @IBOutlet weak var totalPunches: UILabel!
    
    //Instance Variables
    /*
     var currentMaxAccelX: Double = 0.0
     var currentMaxAccelY: Double = 0.0
     var currentMaxAccelZ: Double = 0.0
     
     
     var currentMaxRotX: Double = 0.0
     var currentMaxRotY: Double = 0.0
     var currentMaxRotZ: Double = 0.0
     */
    
    
    var motionManager = CMMotionManager()
    
    /*
     @IBOutlet weak var rotX: UILabel!
     @IBOutlet weak var rotY: UILabel!
     @IBOutlet weak var rotZ: UILabel!
     @IBOutlet weak var maxRotX: UILabel!
     @IBOutlet weak var maxRotY: UILabel!
     @IBOutlet weak var maxRotZ: UILabel!
     */
    
    
    //functions
    
    @IBAction func resetMaxValue() {
        /*
         currentMaxAccelX = 0
         currentMaxAccelY = 0
         currentMaxAccelZ = 0
         
         
         currentMaxRotX = 0
         currentMaxRotY = 0
         currentMaxRotZ = 0
         */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetMaxValue()
        
        //Set Motion Manager Properties
        motionManager.accelerometerUpdateInterval = 0.075
        
        //Start Recording Data
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { accelerometerData, error in
            self.outputAccelerationData(acceleration: (accelerometerData?.acceleration)!)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func outputAccelerationData(acceleration: CMAcceleration) {
        let temp: Double = pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2)
        
        
        if fabs(floor(sqrt(temp)*500)/100) > 30.0 && self.punching == false{
                self.counter += 1
                self.totalPunches.text = String(self.counter)
                print("Punch detected")
                self.punching = true
            
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) {
                _ in
                self.motionManager.stopAccelerometerUpdates()
            }
        }
        
        else{
            self.punching = false
        }
        
    }
    
    /*
     
     func outputRotationData(rotation: CMRotationRate){
     rotX?.text = "\(rotation.x).2fr/s"
     
     if fabs(rotation.x) > fabs(currentMaxRotX){
     currentMaxRotX = rotation.x
     }
     
     rotY?.text = "\(rotation.y).2fr/s"
     
     if fabs(rotation.y) > fabs(currentMaxRotX){
     currentMaxRotX = rotation.y
     }
     
     rotZ?.text = "\(rotation.z).2fr/s"
     
     if fabs(rotation.z) > fabs(currentMaxRotX){
     currentMaxRotX = rotation.z
     }
     
     maxRotX?.text = "\(currentMaxRotX) .2f"
     maxRotY?.text = "\(currentMaxRotY) .2f"
     maxRotZ?.text = "\(currentMaxRotZ) .2f"
     }
     
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}


