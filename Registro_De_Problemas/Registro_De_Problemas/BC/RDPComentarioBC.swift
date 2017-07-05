//
//  RDPComentarioBC.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData


class RDPComentarioBC: NSObject {
    
    typealias Agregar = (_ objComentario : Comentario) -> Void
    typealias MensajeError = (_ mensaje : String) -> Void
    
    class func listarComentarioSegunTicket(_ objTicket : Ticket) -> [Comentario] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return RDPComentarioDALC.listarComentarioSegunTicket(objTicket, conContexto: appDelegate.persistentContainer.viewContext)
        
    }
    
    class func agregar(_ objComentario : RDPComentarioBE, conCorrect correct : Agregar, conError error : MensajeError){
        
        if objComentario.comment?.characters.count == 0 || objComentario.comment == nil{
            error("Ingresa un comentario!")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let objDM = RDPComentarioDALC.agregar(objComentario, conContext: appDelegate.persistentContainer.viewContext)
        
        appDelegate.saveContext()
        
        correct(objDM)
    }

}
