//
//  RDPDetalleViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPDetalleViewController: UIViewController {
    

    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    var objTicket : Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblUsuario.text    = self.objTicket.nombre_Usuario!
        self.lblEstado.text     = self.objTicket.estado!
        self.lblTitulo.text     = self.objTicket.title!
        self.lblDesc.text       = self.objTicket.descripcion!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RDPComentarioViewController"{
            let controller = segue.destination as! RDPComentarioViewController
            controller.objTicket = sender as! Ticket
        }
    }
    

}
