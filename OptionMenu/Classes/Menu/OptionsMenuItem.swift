//
//  OptionsMenuItem.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 8/1/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

public struct OptionsMenuItem {
    let identifier: String
    let title: String
    let imageName: String?
    let selected: Bool
    
    public init(identifier: String,
                title: String,
                imageName: String?,
                selected: Bool = false) {
        self.title = title
        self.imageName = imageName
        self.identifier = identifier
        self.selected = selected
    }
}
