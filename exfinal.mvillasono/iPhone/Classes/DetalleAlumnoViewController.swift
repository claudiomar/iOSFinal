//
//  DetalleAlumnoViewController.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class DetalleAlumnoViewController: UIViewController {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblDni: UILabel!
    @IBOutlet weak var lblUA1: UILabel!
    @IBOutlet weak var lblUA2: UILabel!
    @IBOutlet weak var eParcial: UILabel!
    @IBOutlet weak var eFinal: UILabel!
    @IBOutlet weak var tFinal: UILabel!
    
    @IBOutlet weak var lblNotaFinal: UILabel!
    @IBOutlet weak var lblMensajeFinal: UILabel!

    var objAlumno:Alumno!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uaPorcentaje = 0.2
        let parcialPorcen = 0.1
        let finalPorcen  = 0.2
        let trabajoFinal = 0.3
        
        let notaFinal = (self.objAlumno.uAprendizaje1*uaPorcentaje)+(self.objAlumno.uAprendizaje2*uaPorcentaje)+(self.objAlumno.evParcial * parcialPorcen)+(self.objAlumno.evFinal*finalPorcen)+(self.objAlumno.trabajoFinal*trabajoFinal)
        
       
        self.lblNombre.text = self.objAlumno.nombre ?? "--"
        self.lblApellido.text = self.objAlumno.apellido ?? "--"
        self.lblDni.text = self.objAlumno.dni ?? "--"
        self.lblUA1.text =  "\(self.objAlumno.uAprendizaje1)"
        self.lblUA2.text =  "\(self.objAlumno.uAprendizaje1)"
        self.eParcial.text =  "\(self.objAlumno.evParcial)"
        self.eFinal.text =  "\(self.objAlumno.evFinal)"
        self.tFinal.text =  "\(self.objAlumno.trabajoFinal)"

        self.lblNotaFinal.text =  "\(notaFinal)"
        
        if notaFinal < 13 {
            self.lblMensajeFinal.backgroundColor = UIColor.clear
            self.lblMensajeFinal.backgroundColor = UIColor.red
            self.lblMensajeFinal.textColor = UIColor.white
            
            self.lblNotaFinal.backgroundColor = UIColor.clear
            self.lblNotaFinal.backgroundColor = UIColor.red
            self.lblNotaFinal.textColor = UIColor.white
            
           self.lblMensajeFinal.text = "El alumno está desaprobado!!"
        }else{
            
            self.lblMensajeFinal.backgroundColor = UIColor.clear
            self.lblMensajeFinal.backgroundColor = UIColor.blue
            self.lblMensajeFinal.textColor = UIColor.white
            
            self.lblNotaFinal.backgroundColor = UIColor.clear
            self.lblNotaFinal.backgroundColor = UIColor.blue
            self.lblNotaFinal.textColor = UIColor.white
            
           self.lblMensajeFinal.text = "El alumno está aprobado!!"
        }


        

    }

}
