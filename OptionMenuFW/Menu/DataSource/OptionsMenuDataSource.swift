//
//  OptionsMenuDataSource.swift
//  Al-Mushaf
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation

public protocol OptionsMenuDataSource : class {
    
    func optionsMenuTitle(_ optionsMenu: OptionsMenu) -> String?
    func optionsMenuSubtitle(_ optionsMenu: OptionsMenu) -> String?
    
}

public protocol ListOptionsMenuDataSource : OptionsMenuDataSource {
    
    // Can be Ignored
    func options(_ optionsMenu: OptionsMenu) -> [OptionsMenuItem]?
    
    // Needed for Horizontal Behaviour Only, Can be replaced
    func optionsTitles(_ optionsMenu: OptionsMenu) -> [String]?
    
    func optionsMenu(_ optionsMenu: OptionsMenu, optionAtIndex index: Int) -> OptionsMenuItem?
    func optionsCount(_ optionsMenu: OptionsMenu) -> Int
    
}

public extension ListOptionsMenuDataSource {
    
    func options(_ optionsMenu: OptionsMenu) -> [OptionsMenuItem]? {
        return nil
    }
    
    func optionsTitles(_ optionsMenu: OptionsMenu) -> [String]? {
        return nil
    }
    
}
