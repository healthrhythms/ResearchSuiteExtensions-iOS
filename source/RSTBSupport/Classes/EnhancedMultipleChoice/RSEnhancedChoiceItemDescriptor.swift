//
//  RSEnhancedChoiceItemDescriptor.swift
//  Pods
//
//  Created by James Kizer on 4/8/17.
//
//

import UIKit
import ResearchSuiteTaskBuilder
import Gloss

open class RSEnhancedChoiceItemDescriptor: RSTBChoiceItemDescriptor {
    
    public let identifier: String
    public let auxiliaryItem: JSON?
    
    public required init?(json: JSON) {
        
        //for backwards compatibility, use value for identifer if it's a string
        //note this might still break stuff
        let idOpt: String? = "identifier" <~~ json
        let valueOpt: String? = "value" <~~ json
        
        guard let identifier: String = idOpt ?? valueOpt else {
            return nil
        }
        
        self.identifier = identifier
        self.auxiliaryItem = "auxiliaryItem" <~~ json
        super.init(json: json)
        
    }

}
