//
//  AlumnoViewController.swift
//  exfinal.mvillasono
//
//  Created by mvilla on 7/23/20.
//  Copyright © 2020 Martin Villa . All rights reserved.
//

import UIKit

class AlumnoViewController: UIViewController {
    
    @IBOutlet weak var tlbAlumnos: UITableView!
    
    var arrayAlumnos = [Alumno]()
    
    func crearActionEliminar(indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            
            let objAlumno = self.arrayAlumnos[indexPath.row]
            self.arrayAlumnos.remove(at: indexPath.row)
            AlumnoBL.eliminar(objAlumno)
            
            self.tlbAlumnos.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return action
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
        self.arrayAlumnos = AlumnoBL.listAll()
           self.tlbAlumnos.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
       if let controller = segue.destination as? DetalleAlumnoViewController {
           controller.objAlumno = sender as? Alumno
       }
    }
       
}

extension AlumnoViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            self.arrayAlumnos = AlumnoBL.listAll()
        }else{
            self.arrayAlumnos = AlumnoBL.listByKeySearch(keySearch: searchText)
        }
        
        self.tlbAlumnos.reloadSections(IndexSet(integer: 0), with: .none )

    }
}

extension AlumnoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayAlumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AlumnoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AlumnoTableViewCell
        cell.objAlumno = self.arrayAlumnos[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objAlumno = self.arrayAlumnos[indexPath.row]
        self.performSegue(withIdentifier: "DetalleAlumnoViewController", sender: objAlumno)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionEliminar = self.crearActionEliminar(indexPath: indexPath)
        
        let arrayActions = [actionEliminar]
        
        let actionConfiguration = UISwipeActionsConfiguration(actions: arrayActions)
        return actionConfiguration
    }

}
