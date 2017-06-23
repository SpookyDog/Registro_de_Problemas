//
//  RDPRegistrarViewController.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 6/21/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPRegistrarViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    
    @IBAction func clickBtnUsuario(_ sender: Any) {
        
        let objUser = RDPUsuarioBE()
        
        objUser.usuario_email       = self.txtEmail.text!
        objUser.usuario_name        = self.txtUsuario.text!
        objUser.usuario_password    = self.txtContrasena.text!
        objUser.usuario_telefono    = self.txtTelefono.text!
        objUser.usuario_tipo        = "Usuario"
        
        RDPUsuarioBC.agregar(objUser, conCorrecto: { (objUsuarioDM) in
            
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Registered", conMensaje: "Usuario Registrado", conNombreDeBotonCancelar: "OK", enControlador: self
                , conCompletion: {
                    self.navigationController?.dismiss(animated: true, completion: nil)
            })
            
        }) { (mensajeError) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: nil)
        }
        
    }
    
    @IBAction func clickBtnDeveloper(_ sender: Any) {
        
        let objUser = RDPUsuarioBE()
        
        objUser.usuario_email       = self.txtEmail.text!
        objUser.usuario_name        = self.txtUsuario.text!
        objUser.usuario_password    = self.txtContrasena.text!
        objUser.usuario_telefono    = self.txtTelefono.text!
        objUser.usuario_tipo        = "Developer"
        
        RDPUsuarioBC.agregar(objUser, conCorrecto: { (objUsuarioDM) in
            
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Registered", conMensaje: "Usuario Registrado", conNombreDeBotonCancelar: "OK", enControlador: self
                , conCompletion: {
                    self.navigationController?.dismiss(animated: true, completion: nil)
            })
            
        }) { (mensajeError) in
            CDMUserAlerts.mostrarAlertaConTitulo(titulo: "Error", conMensaje: mensajeError, conNombreDeBotonCancelar: "OK", enControlador: self, conCompletion: nil)
        }

    }
    
    // MARK: - Keyboard
    
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

    @IBAction func tapCerrarTeclado(_ sender: Any) {
        
        self.view.endEditing(true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.cuandoTecladoAparece(_:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.cuandoTecladoDesaparece(_:)), name: .UIKeyboardWillHide, object: nil)

        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
        
        super.viewDidDisappear(animated)
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
