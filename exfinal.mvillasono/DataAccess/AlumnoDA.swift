//
//  AlumnoDA.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import Foundation
import CoreData

class AlumnoDA {
 
    class func create(nombre:String, apellido:String, dni:String, uAprendizaje1:Double, uAprendizaje2:Double, evParcial:Double, evFinal:Double, trabajoFinal:Double, context: NSManagedObjectContext) -> Alumno {
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Alumno", into: context) as! Alumno
    
        objDM.nombre            = nombre
        objDM.apellido          = apellido
        objDM.dni               = dni
        objDM.uAprendizaje1     = uAprendizaje1
        objDM.uAprendizaje2     = uAprendizaje2
        objDM.evParcial         = evParcial
        objDM.evFinal           = evFinal
        objDM.trabajoFinal      = trabajoFinal
        
        return objDM
    }
    
    class func listAll(context: NSManagedObjectContext) -> [Alumno] {
        
        let fetchRequest: NSFetchRequest<Alumno> = Alumno.fetchRequest()
        
        let sortApellido = NSSortDescriptor(key: "apellido", ascending: true)
        let sortNombre   = NSSortDescriptor(key: "nombre", ascending: true)
        fetchRequest.sortDescriptors = [sortApellido, sortNombre]
        
        do {
            let arrayResult = try context.fetch(fetchRequest)
            return arrayResult
        }catch {
            return []
        }
    }
    
    class func listByKeySearch(keySearch: String, context: NSManagedObjectContext) -> [Alumno] {
        
        let fetchRequest: NSFetchRequest<Alumno> = Alumno.fetchRequest()
        
        let predicate = NSPredicate(format: "nombre contains[c] %@ or apellido contains[c] %@ or dni contains[c] %@", keySearch , keySearch , keySearch)
        fetchRequest.predicate = predicate

        do {
            let arrayResult = try context.fetch(fetchRequest)
            return arrayResult
        }catch {
            return []
        }
    }
}

