//
//  RSEnhancedInstructionStepDescriptor.swift
//  Pods
//
//  Created by James Kizer on 7/30/17.
//
//

import UIKit
import ResearchSuiteTaskBuilder
import Gloss

open class RSEnhancedInstructionStepDescriptor: RSTBInstructionStepDescriptor {
    
    public let buttonText: String?
    public let formattedTitle: RSTemplatedTextDescriptor?
    public let formattedText: RSTemplatedTextDescriptor?
    public let gifTitle: String?
    public let gifURL: String?
    public let audioTitle: String?
    public let moveForwardOnTap: Bool
    public let skipButtonText: String?
    
    required public init?(json: JSON) {

        self.buttonText = "buttonText" <~~ json
        self.formattedTitle = "formattedTitle" <~~ json
        self.formattedText = "formattedText" <~~ json
        self.gifTitle = "gif" <~~ json
        self.audioTitle = "audio" <~~ json
        self.moveForwardOnTap = "moveForwardOnTap" <~~ json ?? false
        self.skipButtonText = "skipButtonText" <~~ json
        
        if let gifURLJSON: JSON = "gifURL" <~~ json,
            let urlArray: [String] = "selectOne" <~~ gifURLJSON {
            self.gifURL = urlArray.random()
        }
        else {
            self.gifURL = "gifURL" <~~ json
        }
        
        super.init(json: json)
    }

}
