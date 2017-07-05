//
//  RDPDetalleDesaViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPDetalleDesaViewController: UIViewController {
    
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    var objTicket : Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblUsuario.text    = objTicket.nombre_Usuario!
        self.lblEstado.text     = objTicket.estado!
        self.lblTitulo.text     = objTicket.title!
        self.lblDesc.text       = objTicket.descripcion!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickResuelto(_ sender: Any) {
        self.objTicket.estado = "Resuelto"
        CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Ticket Resuelto", conMensaje: "El Ticket fue resuelto.", conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: {
            _ = self.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func clickCerrado(_ sender: Any) {
        self.objTicket.estado = "Cerrado"
        CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Ticket Cerrado", conMensaje: "El Ticket fue cerrado.", conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: {
            _ = self.navigationController?.popViewController(animated: true)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
