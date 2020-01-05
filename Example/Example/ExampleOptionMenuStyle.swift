//
//  ExampleOptionMenuStyle.swift
//  OptionMenu
//
//  Created by Amr Elsayed on 1/4/20.
//  Copyright © 2020 Amr Elsayed. All rights reserved.
//

import Foundation
import OptionMenu

class ExampleOptionMenuStyle: ListOptionsMenuStyle {
    
    func optionsMenu(_ optionsMenu: OptionsMenu, fontForItemAtIndex index: Int) -> UIFont? {
        
        return UIFont.systemFont(ofSize: 14)
        
    }
    
    func optionsMenuBackgroundColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        
        return UIColor.white
        
    }
    
  
    func optionsMenuTintColor(_ optionsMenu: OptionsMenu) -> UIColor? {
        return UIColor.black
    }
    
}

