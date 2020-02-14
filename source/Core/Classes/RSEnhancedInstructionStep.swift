//
//  RSEnhancedInstructionStep.swift
//  Pods
//
//  Created by James Kizer on 7/30/17.
//
//

import UIKit
import ResearchKit

open class RSEnhancedInstructionStep: RSStep {

    override open func stepViewControllerClass() -> AnyClass {
        return RSEnhancedInstructionStepViewController.self
    }
    
    open var image: UIImage?
    open var audioTitle: String?
    open var moveForwardOnTap: Bool = false
    open var skipButtonText: String?
}
