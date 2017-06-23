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
    
    
    
    class func existeUsuario(_ objUsuario : RDPUsuarioBE, conContext contexto : NSManagedObjectContext, procesoCorrecto correcto : @escaping DIClosures.Correct, procesoIncorrecto incorrecto : @escaping DIClosures.MensajeError){
        
        let fetchRequest : NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        do{
            let predicado = NSPredicate(format: "usuario_email == %@ AND usuario_password == %@", objUsuario.usuario_email!, objUsuario.usuario_password!)
            fetchRequest.predicate = predicado
            
            let arrayResultado = try contexto.fetch(fetchRequest)
            
            if arrayResultado.count == 0 {
                incorrecto("Usuario o contraseña incorrectos")
            }else{
                correcto(arrayResultado[0])
            }
            
        }catch{
            incorrecto("Se produjo un error en la base de datos")
        }
        
    }
    
    class func obtenerUsuarioPorCorreo(_ correo : String, conContext contexto : NSManagedObjectContext) -> Usuario?{
        
        let fetchRequest : NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        do{
            let predicado = NSPredicate(format: "usuario_email == %@", correo)
            fetchRequest.predicate = predicado
            
            let arrayResultado = try contexto.fetch(fetchRequest)
            
            return arrayResultado.count == 0 ? nil : arrayResultado[0]
            
        }catch{
            return nil
        }
        
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
