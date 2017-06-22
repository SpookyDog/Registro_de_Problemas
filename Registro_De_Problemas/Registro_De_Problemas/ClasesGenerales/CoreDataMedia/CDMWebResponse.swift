//
//  CDMWebResponse.swift
//  Survey
//
//  Created by Kenyi Rodriguez on 8/04/16.
//  Copyright © 2016 Core Data Media. All rights reserved.
//

import UIKit

public class CDMWebResponse: NSObject {
    
    public var respuestaJSON   : Any?
    public var statusCode      : NSInteger?
    public var respuestaNSData : Data?
    public var error           : NSError?
    public var datosCabecera   : NSDictionary?
    public var token           : NSString?
    public var cookie          : NSString?
    
}
