//
//  RDPOlvidePasswordViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 6/21/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

protocol RDPOlvidePasswordViewControllerDelegate{
    
    func encontreContrasena(_ controller : RDPOlvidePasswordViewController, conEmail email : String)
    
}

class RDPOlvidePasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    var delegate : RDPOlvidePasswordViewControllerDelegate!
    
    @IBAction func clickBtnBuscar(_ sender: Any) {
        
        RDPUsuarioBC.obtenerUsuarioPorCorrero(self.txtEmail.text!, conCorrect: { (objUsuarioDM) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Contraseña", conMensaje: "Tu contraseña es: "+(objUsuarioDM?.usuario_password)!, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: {
                    self.delegate.encontreContrasena(self, conEmail: self.txtEmail.text!)
                    _ = self.navigationController?.popViewController(animated: true)
            })
        }) { (mensajeError) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
