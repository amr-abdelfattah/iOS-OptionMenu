//
//  OptionsMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by admin on 7/31/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation

public protocol OptionsMenuDisplayBehaviour : class {
    
    func display(_ optionsMenu: OptionsMenu, animated: Bool)
    
    func dismiss(animated: Bool)
    
}
