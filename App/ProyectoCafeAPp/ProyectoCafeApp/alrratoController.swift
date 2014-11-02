//
//  alrratoController.swift
//  ProyectoCafeAPp
//
//  Created by Rodolfo Castillo on 02/11/14.
//  Copyright (c) 2014 Rodolfo Castillo. All rights reserved.
//

import UIKit

class alrratoController: UIViewController, UIPickerViewDelegate {
    
    var intens = 3
    var dulz = 3
    var cnCrema = 1
    var minutos : [String] = ["5 seg","1 min","5 min", "10 min","15 min"]
    var aux = 0
    var timer:NSTimer = NSTimer()
    var counter = 0
    let coffee = CreatingCofee()
    var tiempoSeleccionado = ""
    
    @IBAction func encargo(sender: AnyObject) {
        counter = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1,target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        let alertController = UIAlertController(title: "Excelente! :)", message:
            "Su café estará listo en \(tiempoSeleccionado).", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func updateTimer(){
        counter += 1
        println(counter)
        var aux2 = counter
        if(aux2  == aux){
            timer.invalidate()
            println("Manda Cafe")
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
                
            }else
            {
                let alertController = UIAlertController(title: "Error :(", message:
                    "No ha seleccionado ninguna cantidad de café", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }

        }
    }
    
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
       return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
       return minutos.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return minutos[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        tiempoSeleccionado = minutos[row]
        
        switch tiempoSeleccionado{
        case "5 seg":
            aux = 5
            println(aux)
        case "1 min":
            aux = 60
            println(aux)
        case "5 min":
            aux = 300
            println(aux)
        case "10 min":
            aux = 600
            println(aux)
        case "15 min":
            aux = 900
            println(aux)
        default:
            println("0")
        }
        
        println(tiempoSeleccionado)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aux = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
