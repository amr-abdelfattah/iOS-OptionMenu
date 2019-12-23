//
//  OptionsMenuHelper.swift
//  Al-Mushaf
//
//  Created by Amr on 2/5/18.
//  Copyright © 2017 SmarTech. All rights reserved.
//

import Foundation
import UIKit


//class OptionsMenuHelper: NSObject, MenuPopOverViewDelegate {
//    static let shared = OptionsMenuHelper()

public extension UIViewController {
    
    public func showOptionsMenu(behaviour: OptionsMenuDisplayBehaviour, dataSource: OptionsMenuDataSource, delegate: OptionsMenuDelegate, style: OptionsMenuStyle, data: [String: Any]? = nil) {
     
        
        let optionsMenu = OptionsMenu(parentViewController: self, data: data)
        optionsMenu.behaviour =  behaviour
        optionsMenu.dataSource = dataSource
        optionsMenu.delegate = delegate
        optionsMenu.style = style
        optionsMenu.show(animated: true)
        
    }
    
}
