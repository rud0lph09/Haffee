//
//  ViewController.swift
//  ProyectoCafeAPp
//
//  Created by Rodolfo Castillo on 31/10/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dulz: Int = 0
    var intens: Int = 0
    var maxValor: Int = 10
    var minValor: Int = 0
    var cnCrema: Bool = false
    
    
    @IBOutlet weak var miSwitch: UISwitch!
    @IBOutlet weak var crema: UILabel!
    @IBAction func switchFunc(sender: AnyObject) {
        
        if miSwitch.on {
            
            cnCrema = true
            crema.text = "Con crema"
            
        }
        
        else {
            
            cnCrema = false
            crema.text = "Sin Crema"
            
        }
        
    }
    @IBAction func button(sender: AnyObject) {
        println("Nivel de Intensidad:\(intens)\nNivel de dulsura:\(dulz)\nCon crema?: \(cnCrema)")
    }
    @IBAction func masIntens(sender: AnyObject) {
        intens += 1
        if (intens > maxValor)
        {
            intens = 10
        }
        self.intensLabel.text = "\(intens)"
    }
    @IBAction func menosIntens(sender: AnyObject) {
        intens -= 1
        if (intens < minValor)
        {
            intens = 0
        }
        self.intensLabel.text = "\(intens)"
    }
    @IBAction func masDulz(sender: AnyObject) {
        dulz += 1
        if (dulz > maxValor)
        {
            dulz = 10
        }
        self.dulzLabel.text = "\(dulz)"
    }
    @IBAction func menosDulz(sender: AnyObject) {
        dulz -= 1
        if (dulz < minValor)
        {
            dulz = 0
        }
        self.dulzLabel.text = "\(dulz)"
    }
    @IBOutlet weak var intensLabel: UILabel!
    @IBOutlet weak var dulzLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dulzLabel.text = "0"
        self.intensLabel.text = "0"
        self.crema.text = "Sin Crema"
        self.miSwitch.on = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
