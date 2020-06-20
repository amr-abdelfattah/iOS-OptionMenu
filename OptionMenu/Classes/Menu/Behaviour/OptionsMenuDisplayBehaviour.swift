//
//  OptionsMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 7/31/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

public protocol OptionsMenuDisplayBehaviour : class {
    func display(_ optionsMenu: OptionsMenu, animated: Bool)
    func dismiss(animated: Bool)
}
