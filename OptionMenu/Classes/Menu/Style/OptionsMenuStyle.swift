//
//  OptionsMenuStyle.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 8/7/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

public protocol OptionsMenuStyle : class {
        
    func optionsMenuHeaderBackgroundColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHeaderTintColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHolderTintColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuBackgroundColor(_ optionsMenu: OptionsMenu) -> UIColor?
        
    func optionsMenuTintColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHighlightColor(_ optionsMenu: OptionsMenu) -> UIColor?

    func optionsMenuDividerColor(_ optionsMenu: OptionsMenu) -> UIColor?
        
    func optionsMenuTitleFont(_ optionsMenu: OptionsMenu) -> UIFont?
    
    func optionsMenuFont(_ optionsMenu: OptionsMenu) -> UIFont?
    
}

public protocol ListOptionsMenuStyle : OptionsMenuStyle {
 
    func optionsMenu(_ optionsMenu: OptionsMenu, tintColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, selectedTintColorForItemAtIndex index: Int) -> UIColor?
        
    func optionsMenu(_ optionsMenu: OptionsMenu, backgroundColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, highlightColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, fontForItemAtIndex index: Int) -> UIFont?
    
}

public extension ListOptionsMenuStyle {
    
    func optionsMenu(_ optionsMenu: OptionsMenu, tintColorForItemAtIndex index: Int) -> UIColor? {
        
        return self.optionsMenuTintColor(optionsMenu)
        
    }
       
    func optionsMenu(_ optionsMenu: OptionsMenu, selectedTintColorForItemAtIndex index: Int) -> UIColor? {
        
        return self.optionsMenu(optionsMenu, tintColorForItemAtIndex: index)
        
    }
    
    func optionsMenu(_ optionsMenu: OptionsMenu, backgroundColorForItemAtIndex index: Int) -> UIColor? {
        
        return self.optionsMenuBackgroundColor(optionsMenu)
        
    }
    
    func optionsMenu(_ optionsMenu: OptionsMenu, highlightColorForItemAtIndex index: Int) -> UIColor? {
        
        return self.optionsMenuHighlightColor(optionsMenu)
        
    }
    
    func optionsMenu(_ optionsMenu: OptionsMenu, fontForItemAtIndex index: Int) -> UIFont? {
        
        return self.optionsMenuFont(optionsMenu)
        
    }
    
}

public extension OptionsMenuStyle {
    
    private var defaultHolderColor: UIColor {
        return UIColor(hex: "faf9f3").withAlphaComponent(0.7)
    }
    
    func optionsMenuHeaderBackgroundColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return self.optionsMenuBackgroundColor(optionsMenu)
    }
    
    func optionsMenuHeaderTintColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return self.optionsMenuTintColor(optionsMenu)
    }
    
    func optionsMenuHolderTintColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return self.defaultHolderColor
    }
            
    
    func optionsMenuHighlightColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return nil
    }

    func optionsMenuDividerColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return nil
    }
        
    func optionsMenuTitleFont(_ optionsMenu: OptionsMenu) -> UIFont? {
        return nil
    }
    
    func optionsMenuFont(_ optionsMenu: OptionsMenu) -> UIFont? {
        return nil
    }
    
}
