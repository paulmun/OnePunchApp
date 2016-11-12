//
//  ViewController.swift
//  OnePunchApp
//
//  Created by Paul Mun on 11/11/16.
//  Copyright © 2016 Team No Shoes. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    //Instance Variables
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0

    /*
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    */
 
    
    var motionManager = CMMotionManager()
    
    //Outlets
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    @IBOutlet weak var maxAccX: UILabel!
    @IBOutlet weak var maxAccY: UILabel!
    @IBOutlet weak var maxAccZ: UILabel!
    
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
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0

        /*
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetMaxValue()
        
        //Set Motion Manager Properties
        motionManager.accelerometerUpdateInterval = 0.001
        motionManager.gyroUpdateInterval = 0.2
        
        //Start Recording Data
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { accelerometerData, error in
            self.outputAccelerationData(acceleration: (accelerometerData?.acceleration)!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func outputAccelerationData(acceleration: CMAcceleration){
        accX?.text = "\(acceleration.x).2fg"
        
        if fabs(acceleration.x) > fabs(currentMaxAccelX){
            currentMaxAccelX = acceleration.x
        }
        
        accY?.text = "\(acceleration.y).2fg"
        
        if fabs(acceleration.y) > fabs(currentMaxAccelY)
        {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"
        
        if fabs(acceleration.z) > fabs(currentMaxAccelZ){
            currentMaxAccelZ = acceleration.z
        }
        maxAccX?.text = "\(currentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        maxAccZ?.text = "\(currentMaxAccelZ) .2f"
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


