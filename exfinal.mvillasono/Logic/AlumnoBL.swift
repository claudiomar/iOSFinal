//
//  AlumnoBL.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//
import UIKit

class AlumnoBL {
    
    typealias AlumnoSuccess = (_ game: Alumno) -> Void
    typealias AlumnoError = (_ errorMessage: String) -> Void
    
    class func create(nombre: String?, apellido: String?, dni: String?, uAprendizaje1: Double?, uAprendizaje2: Double?, evParcial:Double?, evFinal:Double?, trabajoFinal:Double?, success: AlumnoSuccess, error: AlumnoError) {
        
        guard let safeNombre = nombre, safeNombre.count != 0 else {
            error("Ingrese un nombre correcto")
            return
        }
        
        guard let safeApellido = apellido, safeApellido.count != 0 else {
            error("Ingrese un apellido correcto")
            return
        }
        
        guard let safeDni = dni, safeDni.count != 0 else {
            error("Ingrese un DNI correcto")
            return
        }
        
        guard let safeUAprendizaje1 = uAprendizaje1, safeUAprendizaje1 != 0 else {
            error("Ingrese un nota en UA1 correcto")
            return
        }
        
        guard let safeUAprendizaje2 = uAprendizaje2, safeUAprendizaje2 != 0 else {
            error("Ingrese un nota en UA2 correcto")
            return
        }
        
        guard let safeEvParcial = evParcial, safeEvParcial != 0 else {
            error("Ingrese un nota en Ev.Parcial correcto")
            return
        }
        
        guard let safeEvFinal = evFinal, safeEvFinal != 0 else {
            error("Ingrese un nota en Ev.Final correcto")
            return
        }
        
        guard let safeTrabajoFinal = trabajoFinal, safeTrabajoFinal != 0 else {
            error("Ingrese un nota en el Trabajo Final correcto")
            return
        }
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        
        let objAlumno = AlumnoDA.create(nombre: safeNombre,
                                        apellido: safeApellido,
                                        dni: safeDni,
                                        uAprendizaje1: safeUAprendizaje1,
                                        uAprendizaje2: safeUAprendizaje2,
                                        evParcial: safeEvParcial,
                                        evFinal: safeEvFinal,
                                        trabajoFinal: safeTrabajoFinal,
                                        context: context)
        
        appDelegateClass.saveContext()
        success(objAlumno)
    }
    
    class func listAll() -> [Alumno] {
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        return AlumnoDA.listAll(context: context)
    }
    
    class func listByKeySearch(keySearch: String) -> [Alumno] {
        
        let appDelegateClass = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegateClass.persistentContainer.viewContext
        return AlumnoDA.listByKeySearch(keySearch: keySearch, context: context)
    }
    
    class func eliminar(_ objAlumno: Alumno) {
           
           let instanciaAppDelegate = UIApplication.shared.delegate as! AppDelegate
           let contexto = instanciaAppDelegate.persistentContainer.viewContext
           contexto.delete(objAlumno)
           instanciaAppDelegate.saveContext()
       }
}

