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
    var cnCrema: Int = 0
    var caracaf: String = ""
    let coffee = CreatingCofee()
    
    
    
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
            
            cnCrema = 1
            crema.text = "Con crema"
            
        }
        
        else {
            
            cnCrema = 0
            crema.text = "Sin Crema"
            
        }
        
    }
    @IBAction func button(sender: AnyObject) {
        
        var intenseFloat: CGFloat = CGFloat(intens)
        var dulzFloat: CGFloat = CGFloat(dulz)
        var cremaFloat: CGFloat = CGFloat(cnCrema)
        
        var haffee: [String: String] = ["coffeeintensity":"\(intenseFloat)", "sweetenerintensity":"\(dulzFloat)", "creamamount":"\(cremaFloat)"]
        println("Nivel de Intensidad:\(intens)\nNivel de dulsura:\(dulz)\nCon crema?: \(cnCrema)")
        let req = Agent.post("http://participacion.mx/api/v0/orders")
        req.send([ "order": haffee])
        req.end({ (response: NSHTTPURLResponse!, data: Agent.Data!, error: NSError!) -> Void in
            // react to the result of your request
        })
       
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
            
        case 1:
            caracaf =  coffee.Intensidad["1"]!
        case 2:
            caracaf =  coffee.Intensidad["2"]!
        case 3:
            caracaf =  coffee.Intensidad["3"]!
        case 4:
            caracaf =  coffee.Intensidad["4"]!
        case 5:
            caracaf =  coffee.Intensidad["5"]!
        default:
            return 0
            
        }
        return 0
    }
    
    func dulzCafe(dulz: Int)->Int{
        
        switch dulz{
            
        case 1:
            caracaf =  coffee.Azucar["1"]!
        case 2:
            caracaf =  coffee.Azucar["2"]!
        case 3:
            caracaf =  coffee.Azucar["3"]!
        case 4:
            caracaf =  coffee.Azucar["4"]!
        case 5:
            caracaf =  coffee.Azucar["5"]!
        default:
            return 0

            
        }
        return 0
    }
    
    


}
