//
//  RDPUsuarioBC.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 6/21/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

typealias Agregar = (_ objUsuario : Usuario) -> Void

class RDPUsuarioBC: NSObject {

    static var sharedInstance = RDPUsuarioBC()
    var objSesionUsuario : Usuario?
    
    
    class func agregar(_ objUser : RDPUsuarioBE, conCorrecto correct : Agregar, conError error : @escaping DIClosures.MensajeError){
        
        if objUser.usuario_email?.characters.count == 0{
            error("Ingresa tu Email")
            return
        }
        
        if objUser.usuario_name?.characters.count == 0{
            error("Ingresa tu usuario")
            return
        }
        
        if objUser.usuario_password?.characters.count == 0{
            error("Ingresa tu password")
            return
        }
        
        if objUser.usuario_telefono?.characters.count == 0{
            error("Ingresa tu telefono")
            return
        }
        
        if objUser.usuario_tipo?.characters.count == 0{
            error("Notifica el desarrollador!!!")
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let objDM = RDPUsuarioDALC.agregar(objUser, conContext: appDelegate.persistentContainer.viewContext)
        appDelegate.saveContext()
        
        RDPUsuarioBC.guardarSesion(deUsuario: objDM)
        
        correct(objDM)
    }
    
    class func login(_ objUsuario : RDPUsuarioBE, correctProcess correct : @escaping DIClosures.Correct, conError error : @escaping DIClosures.MensajeError){
        
        if objUsuario.usuario_email?.characters.count == 0{
            error("Ingresa el usuario")
            return
        }
        
        if objUsuario.usuario_password?.characters.count == 0{
            error("Ingresa la contraseña")
            return
        }
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        RDPUsuarioDALC.existeUsuario(objUsuario, conContext: appDelegate.persistentContainer.viewContext, procesoCorrecto: { (objUsuarioDM) in
            
            RDPUsuarioBC.guardarSesion(deUsuario: objUsuarioDM!)
            correct(objUsuarioDM)
            
        }) { (mensajeError) in
            error(mensajeError)
        }
        
    }
    
    class func guardarSesion(deUsuario objUsuario : Usuario) -> Void {
        
        RDPUsuarioBC.sharedInstance.objSesionUsuario = objUsuario
        CDMKeyChain.guardarDataEnKeychain(NSKeyedArchiver.archivedData(withRootObject: objUsuario.usuario_email!), conCuenta: "CDMLogin", conServicio: "datosUsuario")
    }
    
    
    
    class func obtenerSesionUsuario() -> Usuario?{
        
        let dataUsuario = CDMKeyChain.dataDesdeKeychainConCuenta("CDMLogin", conServicio: "datosUsuario")
        
        if dataUsuario != nil {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let objCorreoUsuario = NSKeyedUnarchiver.unarchiveObject(with: dataUsuario!) as! String
            RDPUsuarioBC.sharedInstance.objSesionUsuario = RDPUsuarioDALC.obtenerUsuarioPorCorreo(objCorreoUsuario, conContext: appDelegate.persistentContainer.viewContext)
            return RDPUsuarioBC.sharedInstance.objSesionUsuario
        }
        
        return RDPUsuarioBC.sharedInstance.objSesionUsuario
    }
    
    
    
    class func eliminarSesionUsuario() -> Void{
        
        RDPUsuarioBC.sharedInstance.objSesionUsuario = nil
        CDMKeyChain.eliminarKeychain()
    }
    
    class func obtenerUsuarioPorCorrero(_ objCorreoUsuario : String, conCorrect correct : @escaping DIClosures.Correct, conError error : @escaping DIClosures.MensajeError){
        
        if objCorreoUsuario.characters.count == 0 {
            error("Ingresa tu Email")
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let objDM = RDPUsuarioDALC.obtenerUsuarioPorCorreo(objCorreoUsuario, conContext: appDelegate.persistentContainer.viewContext){
            
            correct(objDM)
            
        }else{
            error("Tu email es incorrecto")
        }
        
    }
    
    
}
