//
//  ViewController.swift
//  iTimer
//
//  Created by Rodolfo Castillo on 02/11/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var test = 5
    var counter = 0
    var timer:NSTimer = NSTimer()

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func resetButon(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        self.timerLabel.text="0"
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1,target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func playButton(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1,target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    
    
    
    
    func updateTimer(){
        self.timerLabel.text = String(counter++)
        var aux2 = counter
        if(aux2  == test){
            println("Manda Cafe")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerLabel.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

