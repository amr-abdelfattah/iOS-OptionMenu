//
//  HorizontalMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by admin on 8/5/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

class HorizontalMenuDisplayBehaviour {
    
    var horizontalOptionsMenu : HorizontalOptionsMenu!
    let popOverPoint : CGPoint
    
    init(popOverPoint: CGPoint) {
        
        self.popOverPoint = popOverPoint
        
    }
    
    func initOptionsContainerViewController(_ optionsMenu : OptionsMenu) {
        
        self.horizontalOptionsMenu = HorizontalOptionsMenu()
        self.horizontalOptionsMenu.optionsMenu = optionsMenu
        
    }
    
}

extension HorizontalMenuDisplayBehaviour : OptionsMenuDisplayBehaviour {
    
    func display(_ optionsMenu: OptionsMenu, animated: Bool) {
        
        initOptionsContainerViewController(optionsMenu)
        
       self.horizontalOptionsMenu.presentPopover(from: CGRect(origin: popOverPoint, size: CGSize.zero), in: optionsMenu.parentViewController.view, withStrings: (optionsMenu.dataSource as? ListOptionsMenuDataSource)?.optionsTitles(optionsMenu))
        
        self.horizontalOptionsMenu.becomeFirstResponder()
        
    }
    
    func dismiss(animated: Bool) {
    }
    
}
