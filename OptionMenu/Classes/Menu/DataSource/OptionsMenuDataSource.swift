//
//  OptionsMenuDataSource.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 8/1/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

public protocol OptionsMenuDataSource : class {
    func optionsMenuTitle(_ optionsMenu: OptionsMenu) -> String?
    func optionsMenuSubtitle(_ optionsMenu: OptionsMenu) -> String?
}

public protocol HorizontalListOptionsMenuDataSource : OptionsMenuDataSource {
    func optionsTitles(_ optionsMenu: OptionsMenu) -> [String]?
}

public protocol ListOptionsMenuDataSource : OptionsMenuDataSource {
    func optionsMenu(_ optionsMenu: OptionsMenu, optionAtIndex index: Int) -> OptionsMenuItem?
    func optionsCount(_ optionsMenu: OptionsMenu) -> Int
}
