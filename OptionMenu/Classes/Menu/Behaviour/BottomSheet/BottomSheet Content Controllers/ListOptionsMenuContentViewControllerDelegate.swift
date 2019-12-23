//
//  File.swift
//  Makka
//
//  Created by admin on 8/13/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

public class ListOptionsMenuContentViewControllerDelegate : OptionsMenuContentViewControllerDelegate {
    
    public init() {}
    
    public func contentViewController(_ optionsMenu: OptionsMenu) -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "BottomSheetMenuOptions", bundle: Bundle(for: BottomSheetMenuOptionsContainer.self))
        
        let bottomSheetContentViewController = storyboard.instantiateViewController(withIdentifier: "BottomSheetMenuOptionsContainer") as? BottomSheetMenuOptionsContainer
        bottomSheetContentViewController?.optionsMenu = optionsMenu
        
        return bottomSheetContentViewController
        
    }
    
}
