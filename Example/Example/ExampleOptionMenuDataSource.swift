//
//  ExampleOptionMenuDataSource.swift
//  OptionMenu_Tests
//
//  Created by Amr Elsayed on 1/5/20.
//  Copyright © 2020 Amr Elsayed. All rights reserved.
//


import Foundation
import OptionMenu

class ExampleOptionMenuDataSource : ListOptionsMenuDataSource {
    
    func optionsMenuTitle(_ optionsMenu: OptionsMenu) -> String? {
        return nil
    }
    
    func optionsMenuSubtitle(_ optionsMenu: OptionsMenu) -> String? {
        return nil
    }
    
    func optionsCount(_ optionsMenu: OptionsMenu) -> Int {
        
        return 5
        
    }
    
    func optionsMenu(_ optionsMenu: OptionsMenu, optionAtIndex index: Int) -> OptionsMenuItem? {
        
        return OptionsMenuItem(identifier: String(index),
        title: "New Option Menu At \(index)", imageName: "ic_optionmenu")
        
    }
    
}
