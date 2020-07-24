//
//  AlumnoTableViewCell.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class AlumnoTableViewCell: UITableViewCell{
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellido: UILabel!
    @IBOutlet weak var lblDni: UILabel!
    
    var objAlumno:Alumno!{
        didSet{
            self.actualizarData()
        }
    }
    
    func actualizarData(){
        self.lblNombre.text = self.objAlumno.nombre ?? "--"
        self.lblApellido.text = self.objAlumno.apellido ?? "--"
        self.lblDni.text = self.objAlumno.dni ?? "--"
    }

    
}
