//
//  RDPComentarioDALC.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 7/5/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit
import CoreData

class RDPComentarioDALC: NSObject {
    
    class func listarComentarioSegunTicket(_ objTicket : Ticket, conContexto context : NSManagedObjectContext) -> [Comentario]{
        
        let fetchRequest : NSFetchRequest<Comentario> = Comentario.fetchRequest()
        
        do{
            let ordenaPorFecha = NSSortDescriptor(key: "date", ascending: false)
            let predicado = NSPredicate(format: "Ticket == %@", objTicket)
            fetchRequest.predicate = predicado
            fetchRequest.sortDescriptors = [ordenaPorFecha]
            return try context.fetch(fetchRequest)
        }catch{
            return [Comentario]()
        }
        
    }
    
    class func agregar(_ objComentario : RDPComentarioBE, conContext context : NSManagedObjectContext) -> Comentario{
        
        let objDM = NSEntityDescription.insertNewObject(forEntityName: "Comentario", into: context) as! Comentario
        
        objDM.comment           = objComentario.comment
        objDM.nombre_Usuario    = objComentario.nombre_Usuario
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy hh:mm:ss"
        let dateString = dateFormatter.string(from: date as Date)
        
        objDM.date              = dateString
        
        return objDM
    }

}
