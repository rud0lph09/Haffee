//
//  ViewController.swift
//  Haffee
//
//  Created by Rodolfo Castillo on 04/11/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var conteo: UILabel!
    @IBOutlet weak var Conteo2: UILabel!
    
    let haffee = coffee()

    
    @IBAction func more1(sender: AnyObject) {
        haffee.moreIntens()
        self.conteo.text = ("\(haffee.intensity)")
    }
    @IBAction func min1(sender: AnyObject) {
        haffee.lessIntens()
        self.conteo.text = ("\(haffee.intensity)")
    }
    
    @IBAction func more2(sender: AnyObject) {
        haffee.moreSweet()
        self.Conteo2.text = ("\(haffee.sweetness)")
    }
    @IBAction func less2(sender: AnyObject) {
        haffee.lessSweet()
        self.Conteo2.text = ("\(haffee.sweetness)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.conteo.text = "Ingresa Valor"
        self.Conteo2.text = "Ingresa Valor"
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

