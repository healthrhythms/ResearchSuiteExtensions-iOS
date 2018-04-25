//
//  RSEnhancedMultipleChoiceBaseCellController.swift
//  ResearchSuiteExtensions
//
//  Created by James Kizer on 4/25/18.
//

import UIKit
import ResearchKit

open class RSEnhancedMultipleChoiceBaseCellController: NSObject, RSEnhancedMultipleChoiceCellController, RSEnhancedMultipleChoiceCellDelegate {
    
    //this needs to be done by child
    open var isValid: Bool {
//        assertionFailure("Not Implemented")
        assert(self.auxiliaryItem == nil)
        return true
    }
    
    //ok for base
    open func configureCell(cell: RSEnhancedMultipleChoiceCell, selected: Bool) {
        
        assert(selected == self.isSelected)
        
        cell.configure(forTextChoice: self.textChoice, delegate: self)
//        cell.setSelected(self.isSelected, animated: false)
        cell.updateUI(selected: self.isSelected, animated: false, updateResponder: false)
        cell.setNeedsLayout()
    }
    
    //ok for base
    open func clearAnswer() {
        self.selected = false
        self.validatedResult = nil
    }
    
    //needs to be implemented by child
    open var choiceSelection: RSEnahncedMultipleChoiceSelection? {
        
        guard self.isSelected else {
            return nil
        }
        
        assert(self.isValid)
        guard self.isValid else {
            return nil
        }
        
        return RSEnahncedMultipleChoiceSelection(identifier: self.textChoice.identifier, value: self.textChoice.value, auxiliaryResult: self.auxiliaryItemResult)
    }
    
    //ok for base
    open func setSelected(selected: Bool, cell: RSEnhancedMultipleChoiceCell) {
        self.selected = selected
    }
    
    //ok for base
    open var identifier: String {
        return self.textChoice.identifier
    }
    
    //ok for base
    open let textChoice: RSTextChoiceWithAuxiliaryAnswer
    
    //ok for base
    open var auxiliaryItem: ORKFormItem? {
        return self.textChoice.auxiliaryItem
    }
    
    //ok for base
    open var hasAuxiliaryItem: Bool {
        return self.textChoice.auxiliaryItem != nil
    }
    
    //ok for base
    open var isSelected: Bool {
        return self.selected
    }
    
    //needs to be implemented by child
    public func viewForAuxiliaryItem(item: ORKFormItem, cell: RSEnhancedMultipleChoiceCell) -> UIView? {
        assertionFailure("Not Implemented")
        return nil
    }
    
    //ok for base
    open var isAuxiliaryItemOptional: Bool? {
        return self.auxiliaryItem?.isOptional
    }
    
    //ok for base
    open var isAuxiliaryItemValid: Bool? {
        return false
    }
    
    open var onValidationFailed: ((String) -> ())?
    open var onAuxiliaryItemResultChanged: (() -> ())?
    
    open var auxiliaryItemResult: ORKResult? {
        return self.validatedResult
    }
    
    open var validatedResult: ORKResult? {
        didSet {
            self.onAuxiliaryItemResultChanged?()
        }
    }
//    private var currentText: String?
    private var selected: Bool
    
    public init?(textChoice: RSTextChoiceWithAuxiliaryAnswer, choiceSelection: RSEnahncedMultipleChoiceSelection?, onValidationFailed: ((String) -> ())?, onAuxiliaryItemResultChanged: (() -> ())?) {
        
        self.textChoice = textChoice
        self.selected = choiceSelection != nil
        self.validatedResult = choiceSelection?.auxiliaryResult
        
        self.onValidationFailed = onValidationFailed
        self.onAuxiliaryItemResultChanged = onAuxiliaryItemResultChanged
        
        //initialize based on choice selection
        
        super.init()
        
    }

}
