//
//  OptionsMenu.swift
//  Al-Mushaf
//
//  Created by admin on 7/31/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

open class OptionsMenu : NSObject {
    
    public unowned var parentViewController : UIViewController
    public weak var dataSource : OptionsMenuDataSource?
    public weak var delegate : OptionsMenuDelegate?
    public var style : OptionsMenuStyle?
    public var size : CGSize?
    public var data: [String: Any]?
//    var optionsMenuContentViewControllerDelegate : OptionsMenuContentViewControllerDelegate?
    
    public var behaviour : OptionsMenuDisplayBehaviour?
    
    public init(parentViewController : UIViewController, data: [String: Any]? = nil) {
        
        self.parentViewController = parentViewController
        self.data = data
        
    }
    
    open func show(animated: Bool) {
        self.behaviour?.display(self, animated: animated)
    }
    
    open func dismiss(animated: Bool) {
        self.behaviour?.dismiss(animated: animated)
    }
    
}
