//
//  ViewController.swift
//  ProyectoCafeAPp
//
//  Created by Rodolfo Castillo as Haffee Dev team Member on 31/10/14.
//  Copyright (c) 2014 Rodolfo Castillo as Haffee Dev team Member. All rights reserved.
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
    var aux = 0
    
        /*intens = Int(sender.value)
        caraCafe(intens)
        self.intensLabel.text = "\(caracaf)"*/
    
    
        /*dulz = Int(sender.value)
        dulzCafe(dulz)
        self.dulzLabel.text = "\(caracaf)"*/
    

    
    @IBOutlet weak var cuch1: UIImageView!
    @IBOutlet weak var cuch2: UIImageView!
    @IBOutlet weak var cuch3: UIImageView!
    @IBOutlet weak var cuch4: UIImageView!
    @IBOutlet weak var cuch5: UIImageView!
    
    @IBOutlet weak var cuch6: UIImageView!
    @IBOutlet weak var cuch7: UIImageView!
    @IBOutlet weak var cuch8: UIImageView!
    @IBOutlet weak var cuch9: UIImageView!
    @IBOutlet weak var cuch10: UIImageView!
 
    @IBOutlet weak var miSwitch: UISwitch!
    @IBOutlet weak var crema: UILabel!
    @IBOutlet weak var milkIcon: UIImageView!
    
    
    @IBAction func plusIntens(sender: AnyObject) {
        intens += 1
        if(intens >= 5){
            intens = 5
        }
        if(intens <= 0){
            intens = 0
        }
        if(intens == 1){
            self.cuch1.image =  UIImage(named: "brightSpoon")
            
        }else{
            if(intens == 2){
            self.cuch2.image = UIImage(named: "brightSpoon")
            }else{
                if(intens == 3){
                    self.cuch3.image = UIImage(named: "brightSpoon")
                }else{
                    if(intens == 4){
                        self.cuch4.image = UIImage(named: "brightSpoon")
                    }else{
                        if(intens == 5){
                            self.cuch5.image = UIImage(named: "brightSpoon")
                        }
                    }
                }
            }
        
        }
    }
    @IBAction func minIntens(sender: AnyObject) {
        intens -= 1
        if(intens >= 5){
            intens = 5
        }
        if(intens <= 0){
            intens = 0
        }
        if(intens == 0){
            self.cuch1.image =  UIImage(named: "darkSpoon")
            
        }else{
            if(intens == 1){
                self.cuch2.image = UIImage(named: "darkSpoon")
            }else{
                if(intens == 2){
                    self.cuch3.image = UIImage(named: "darkSpoon")
                }else{
                    if(intens == 3){
                        self.cuch4.image = UIImage(named: "darkSpoon")
                    }else{
                        if(intens == 4){
                            self.cuch5.image = UIImage(named: "darkSpoon")
                        }
                    }
                }
            }
            
        }
    }
    
    @IBAction func plusDulz(sender: AnyObject) {
        dulz += 1
        if(dulz >= 5){
            dulz = 5
        }
        if(dulz <= 0){
            dulz = 0
        }
        if(dulz == 1){
            self.cuch6.image =  UIImage(named: "brightSpoon")
            
        }else{
            if(dulz == 2){
                self.cuch7.image = UIImage(named: "brightSpoon")
            }else{
                if(dulz == 3){
                    self.cuch8.image = UIImage(named: "brightSpoon")
                }else{
                    if(dulz == 4){
                        self.cuch9.image = UIImage(named: "brightSpoon")
                    }else{
                        if(dulz == 5){
                            self.cuch10.image = UIImage(named: "brightSpoon")
                        }
                    }
                }
            }
            
        }
    }
    @IBAction func minDulz(sender: AnyObject) {
        dulz -= 1
        if(dulz >= 5){
            dulz = 5
        }
        if(dulz <= 0){
            dulz = 0
        }
        if(dulz == 0){
            self.cuch6.image =  UIImage(named: "darkSpoon")
            
        }else{
            if(dulz == 1){
                self.cuch7.image = UIImage(named: "darkSpoon")
            }else{
                if(dulz == 2){
                    self.cuch8.image = UIImage(named: "darkSpoon")
                }else{
                    if(dulz == 3){
                        self.cuch9.image = UIImage(named: "darkSpoon")
                    }else{
                        if(dulz == 4){
                            self.cuch10.image = UIImage(named: "darkSpoon")
                        }
                    }
                }
            }
            
        }
    }
    
    @IBAction func switchFunc(sender: AnyObject) {
        
        if miSwitch.on {
            cnCrema = 1
            self.milkIcon.image = UIImage(named: "milkCarton")
        }
        
        else {
            cnCrema = 0
            self.milkIcon.image = UIImage(named: "darkMilk")
            
        }
        
    }
    @IBAction func alrratin(sender: AnyObject) {
        if(intens <= 0){
            let alertController = UIAlertController(title: "Advertencia!", message:
                "Seleccione una cantidad de café", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    @IBAction func button(sender: AnyObject) {
        if(intens > 0){
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
            let alertController = UIAlertController(title: "Excelente! :)", message:
                "Su café estará listo en unos momentos.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else
        {
            let alertController = UIAlertController(title: "Error :(", message:
                "No ha seleccionado ninguna cantidad de café", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
       
    }
    
  
    @IBOutlet weak var intensLabel: UILabel!
    @IBOutlet weak var dulzLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            self.cuch6.image = UIImage(named: "brightSpoon")
            self.cuch7.image = UIImage(named: "darkSpoon")
            self.cuch8.image = UIImage(named: "darkSpoon")
            self.cuch9.image = UIImage(named: "darkSpoon")
            self.cuch10.image = UIImage(named: "darkSpoon")
        case 2:
            caracaf =  coffee.Azucar["2"]!
            self.cuch6.image = UIImage(named: "brightSpoon")
            self.cuch7.image = UIImage(named: "brightSpoon")
            self.cuch8.image = UIImage(named: "darkSpoon")
            self.cuch9.image = UIImage(named: "darkSpoon")
            self.cuch10.image = UIImage(named: "darkSpoon")
        case 3:
            caracaf =  coffee.Azucar["3"]!
            self.cuch6.image = UIImage(named: "brightSpoon")
            self.cuch7.image = UIImage(named: "brightSpoon")
            self.cuch8.image = UIImage(named: "brightSpoon")
            self.cuch9.image = UIImage(named: "darkSpoon")
            self.cuch10.image = UIImage(named: "darkSpoon")
        case 4:
            caracaf =  coffee.Azucar["4"]!
            self.cuch6.image = UIImage(named: "brightSpoon")
            self.cuch7.image = UIImage(named: "brightSpoon")
            self.cuch8.image = UIImage(named: "brightSpoon")
            self.cuch9.image = UIImage(named: "brightSpoon")
            self.cuch10.image = UIImage(named: "darkSpoon")
        case 5:
            caracaf =  coffee.Azucar["5"]!
            self.cuch6.image = UIImage(named: "brightSpoon")
            self.cuch7.image = UIImage(named: "brightSpoon")
            self.cuch8.image = UIImage(named: "brightSpoon")
            self.cuch9.image = UIImage(named: "brightSpoon")
            self.cuch10.image = UIImage(named: "brightSpoon")
        default:
            return 0

            
        }
        return 0
    }
    
    


}
