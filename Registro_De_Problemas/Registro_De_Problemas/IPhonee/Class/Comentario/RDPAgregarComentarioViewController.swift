//
//  RDPAgregarComentarioViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPAgregarComentarioViewController: UIViewController {

    @IBOutlet weak var txvComment: UITextView!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickGuardar(_ sender: Any) {
        
        let objComentario = RDPComentarioBE()
        
        objComentario.comment           = self.txvComment.text
        objComentario.nombre_Usuario    = RDPUsuarioBC.sharedInstance.objSesionUsuario?.usuario_name
        
        RDPComentarioBC.agregar(objComentario, conCorrect: { (objDM) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Comentario Creado", conMensaje: "El comentario fue agregado.", conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: {
                _ = self.navigationController?.popViewController(animated: true)
            })
        }) { (mensajeError) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: nil)
        }
        
    }
    
    //MARK: - Teclado
    
    @IBAction func tapCerrarTeclado(_ sender: Any) {
        self.view.endEditing(true)

    }
    
    func cuandoTecladoAparece(_ notification : NSNotification){
        
        let kbSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        
        UIView.animate(withDuration: 0.25) {
            
            self.constraintBottomScroll.constant = (kbSize?.height)!
            self.view.layoutIfNeeded()
        }
        
    }
    
    func cuandoTecladoDesaparece(_ notification : NSNotification){
        
        UIView.animate(withDuration: 0.25) {
            
            self.constraintBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
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
