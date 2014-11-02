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
    var caracaf: String = ""
    
    @IBAction func getter(sender: AnyObject) {
        let alertController = UIAlertController(title: "Su Cafe esta Listo", message:
            "Tenga un excelente día :)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var intensSlider: UISlider!
    @IBOutlet weak var dulzSlider: UISlider!

    @IBAction func IntensidadSlide(sender: UISlider) {
        intens = Int(sender.value)
        caraCafe(intens)
        self.intensLabel.text = "\(caracaf)"
    }
    @IBAction func dulzSlide(sender: UISlider) {
        dulz = Int(sender.value)
        dulzCafe(dulz)
        self.dulzLabel.text = "\(caracaf)"
    }



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
    
  
    @IBOutlet weak var intensLabel: UILabel!
    @IBOutlet weak var dulzLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dulzLabel.text = "Agregue Azucar"
        self.intensLabel.text = "Agregue Café"
        self.crema.text = "Sin Crema"
        self.miSwitch.on = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func caraCafe(intens: Int)->Int{
        
        switch intens{
            
        case 1...2:
            caracaf = "Ligero"
        case 3...4:
            caracaf = "Normal"
        case 5...6:
            caracaf = "Intenso"
        case 7...8:
            caracaf = "Levanta-Muertos"
        case 9...10:
            caracaf = "IN-HUMANO!"
        default:
            return 0
            
        }
        return 0
    }
    
    func dulzCafe(dulz: Int)->Int{
        
        switch dulz{
            
        case 1...2:
            caracaf = "Sugar-Free!"
        case 3...4:
            caracaf = "Cucharadita"
        case 5...6:
            caracaf = "Cubos"
        case 7...8:
            caracaf = "Terrones"
        case 9...10:
            caracaf = "Hanzel y Gretel"
        default:
            return 0
            
        }
        return 0
    }



}
