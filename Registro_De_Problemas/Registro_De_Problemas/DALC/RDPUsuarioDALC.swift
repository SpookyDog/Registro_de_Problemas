//
//  RDPUsuarioDALC.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 6/21/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

class RDPUsuarioDALC: NSObject {
    
    
    
    class func validarUsuario(_ objUsuario : RDPUsuarioBE) -> Bool{
        
        let arrayUsuario = [Usuario]()
        
        for user in arrayUsuario {
            
            if( user.usuario_name == objUsuario.usuario_name
                && user.usuario_password == objUsuario.usuario_password){
                return true
            }
            
        }
        
        return false
        
    }
    
    @discardableResult class func agregar(_ objUsuario : RDPUsuarioBE, conContext contexto : NSManagedObjectContext) -> Usuario {
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: contexto) as! Usuario
        
        objDM.usuario_email     = objUsuario.usuario_email
        objDM.usuario_name      = objUsuario.usuario_name
        objDM.usuario_password  = objUsuario.usuario_password
        objDM.usuario_telefono  = objUsuario.usuario_telefono
        objDM.usuario_tipo      = objUsuario.usuario_tipo
        
        return objDM
        
    }
    
}
