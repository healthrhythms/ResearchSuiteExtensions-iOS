//
//  RSEnhancedInstructionStepGenerator.swift
//  Pods
//
//  Created by James Kizer on 7/30/17.
//
//

import UIKit
import ResearchKit
import ResearchSuiteTaskBuilder
import Gloss
import SwiftyMarkdown
import Mustache

open class RSEnhancedInstructionStepGenerator: RSTBBaseStepGenerator {
    
    public init(){}
    
    open var supportedTypes: [String]! {
        return ["RSEnhancedInstructionStep"]
    }

    open func generateStep(type: String, jsonObject: JSON, helper: RSTBTaskBuilderHelper) -> ORKStep? {
        
        guard let stepDescriptor = RSEnhancedInstructionStepDescriptor(json:jsonObject),
            let stateHelper = helper.stateHelper else {
                return nil
        }
        
        let step = RSEnhancedInstructionStep(identifier: stepDescriptor.identifier)
        step.title = helper.localizationHelper.localizedString(stepDescriptor.title)
        step.text = helper.localizationHelper.localizedString(stepDescriptor.text)
        
        if let formattedTitle = stepDescriptor.formattedTitle {
            step.attributedTitle = self.generateAttributedString(descriptor: formattedTitle, helper: helper)
        }
        
        if let formattedText = stepDescriptor.formattedText {
            step.attributedText = self.generateAttributedString(descriptor: formattedText, helper: helper)
        }
        
        if let buttonText = stepDescriptor.buttonText {
            step.buttonText = helper.localizationHelper.localizedString(buttonText)
        }
    
        if let imageTitle = stepDescriptor.imageTitle,
            let image = UIImage(named: imageTitle) {
            step.image = image
        }
        
        step.audioTitle = stepDescriptor.audioTitle
        step.moveForwardOnTap = stepDescriptor.moveForwardOnTap
        step.skipButtonText = helper.localizationHelper.localizedString(stepDescriptor.skipButtonText)
        
        return step
    }
    
    open func processStepResult(type: String,
                                jsonObject: JsonObject,
                                result: ORKStepResult,
                                helper: RSTBTaskBuilderHelper) -> JSON? {
        return nil
    }
    
    

}
