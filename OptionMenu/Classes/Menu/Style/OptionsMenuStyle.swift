//
//  OptionsMenuStyle.swift
//  Al-Mushaf
//
//  Created by admin on 8/7/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

// ALL these functions need to be minimized
public protocol OptionsMenuStyle : class {
    
    func optionsMenuTitleColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuBackgroundColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHeaderColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHeaderTintColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuTextColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuTintColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuDividerColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuHighlightColor(_ optionsMenu: OptionsMenu) -> UIColor?
    
    func optionsMenuTitleFont(_ optionsMenu: OptionsMenu) -> UIFont?
    
}

public protocol ListOptionsMenuStyle : OptionsMenuStyle {
 
    func optionsMenu(_ optionsMenu: OptionsMenu, tintColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, textColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, backgroundColorForItemAtIndex index: Int) -> UIColor?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, fontForItemAtIndex index: Int) -> UIFont?
    
}

extension OptionsMenuStyle {
    
    func optionsMenuHeaderColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuHeaderTintColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuTextColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuTintColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuDividerColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuHighlightColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return nil
        
    }
    
    func optionsMenuTitleFont(_ optionsMenu: OptionsMenu) -> UIFont? {
        
        return nil
        
    }
    
}
