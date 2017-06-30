//
//  RDPAgregarTicketViewController.swift
//  Registro_De_Problemas
//
//  Created by B303-04 on 29/06/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPAgregarTicketViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txvDescripcion: UITextView!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        
        let objTicket = RDPTicketBE()
        
        objTicket.descripcion       = self.txvDescripcion.text!
        objTicket.estado            = "Activo"
        objTicket.titulo            = self.txtTitulo.text!
        objTicket.nombre_Usuario    = RDPUsuarioBC.sharedInstance.objSesionUsuario?.usuario_name!
        
        RDPTicketBC.agregar(objTicket, conCorrecto: { (TicketDM) in
            
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Ticket Creado", conMensaje: "El ticket fue creado.", conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: { 
                _ = self.navigationController?.popViewController(animated: true)
            })
            
        }) { (mensajeError) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: nil)
        }
        
        
    }
    
    // MARK: - Teclado
    
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
    
    // MARK: - TextView
    
    func textViewDidChange(_ textView: UITextView) {
        if(!textView.hasText){
            self.lblPlaceHolder.isHidden = false
        }else{
            self.lblPlaceHolder.isHidden = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(!textView.hasText){
            self.lblPlaceHolder.isHidden = false
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
