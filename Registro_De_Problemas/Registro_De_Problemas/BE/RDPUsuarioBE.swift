//
//  RDPUsuarioBE.swift
//  Registro_De_Problemas
//
//  Created by Daniel V on 6/21/17.
//  Copyright © 2017 Daniel V. All rights reserved.
//

import UIKit

class RDPUsuarioBE: NSObject, NSCoding {
    
    static var sharedInstance   : RDPUsuarioBE?
    
    var usuario_email       : String?
    var usuario_name        : String?
    var usuario_password    : String?
    var usuario_telefono    : String?
    var usuario_tipo        : String?
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder){
        
        self.usuario_email      = aDecoder.decodeObject(forKey: "usuario_email")    as? String
        self.usuario_name       = aDecoder.decodeObject(forKey: "usuario_name")     as? String
        self.usuario_password   = aDecoder.decodeObject(forKey: "usuario_password") as? String
        self.usuario_telefono   = aDecoder.decodeObject(forKey: "usuario_telefono") as? String
        self.usuario_tipo       = aDecoder.decodeObject(forKey: "usuario_tipo") as? String
        
    }
    
    func encode(with aCoder: NSCoder){
        
        aCoder.encode(self.usuario_email,       forKey:"usuario_email")
        aCoder.encode(self.usuario_name,        forKey: "usuario_name")
        aCoder.encode(self.usuario_password,    forKey: "usuario_password")
        aCoder.encode(self.usuario_telefono,    forKey: "usuario_telefono")
        aCoder.encode(self.usuario_tipo,        forKey: "usuario_tipo")
        
    }
    
}
