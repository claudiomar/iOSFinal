//
//  AgregarAlumnoViewController.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class AgregarAlumnoViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtUA1: UITextField!
    @IBOutlet weak var txtUA2: UITextField!
    @IBOutlet weak var eParcial: UITextField!
    @IBOutlet weak var eFinal: UITextField!
    @IBOutlet weak var tFinal: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickAgregarAlumno(_ sender:Any){
        let nombre = self.txtNombre.text
        let apellido = self.txtApellido.text
        let dni = self.txtDni.text
        let ua1 = Double(self.txtUA1.text ?? "")
        let ua2 = Double(self.txtUA2.text ?? "")
        let eParcial = Double(self.eParcial.text ?? "")
        let eFinal = Double(self.eFinal.text ?? "")
        let tFinal = Double(self.tFinal.text ?? "")
        
        AlumnoBL.create(nombre: nombre,
                        apellido: apellido,
                        dni: dni,
                        uAprendizaje1: ua1,
                        uAprendizaje2: ua2,
                        evParcial: eParcial,
                        evFinal: eFinal,
                        trabajoFinal: tFinal,
                        success: { (objAlumno) in
                            self.navigationController?.popViewController(animated: true)

                          

        }) { (mensajeError) in
            print(mensajeError)
        }


    }
}
