//
//  HorizontalOptionsMenu.swift
//  Al-Mushaf
//
//  Created by admin on 8/5/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

class HorizontalOptionsMenu : MenuPopOverView {
    
//    private static let defaultUnselectedTintColor = UIColor.Tint_icons
//    private static let defaultSelectedTintColor = UIDecorator.isNightMode() ? UIColor(hex: "d78d8d") : UIColor(hex: "a31b1b")
//    private static let defaultUnselectedTextColor = UIColor.txt_mainColor
//    private static let defaultSelectedTextColor = defaultUnselectedTextColor
    private let defaultTextColor = UIColor(hex: "777777")
//    private static let defaultItemBackgroundColor = UIColor.BG_popOverMenuView
    private let defaultBackgroundColor = UIColor(hex: "eeeeee")
    //    private static let defaultTitleColor = UIDecorator.isNightMode() ? UIColor(hex: "ffffff") : UIColor(hex: "777777")
    private let defaultDividerColor = UIColor(hex: "d7b93e")
    private let defaultHighlightColor = UIColor(hex: "d7b93e")
    
    
    private weak var optionsDataSource: ListOptionsMenuDataSource?
    private weak var optionsDelegate: ListOptionsMenuDelegate?
    private var optionsStyle: OptionsMenuStyle?
    
    unowned var optionsMenu: OptionsMenu! {
        
        didSet {
            initProtocols()
        }
    }
    
    func initProtocols()  {
        
        self.optionsDataSource = self.optionsMenu.dataSource as? ListOptionsMenuDataSource
        self.optionsDelegate = self.optionsMenu.delegate as? ListOptionsMenuDelegate
        self.optionsStyle = self.optionsMenu.style
        self.delegate = self
        
    }
    
    init() {
        
        super.init(frame: CGRect.zero)
        initColors()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(frame: CGRect.zero)
        initColors()
    }
    
    func initColors() {
        
        self.popOverBackgroundColor = self.optionsStyle?.optionsMenuBackgroundColor(self.optionsMenu) ?? defaultBackgroundColor
        self.popOverTextColor = self.optionsStyle?.optionsMenuTextColor(self.optionsMenu) ?? defaultTextColor
        self.popOverDividerColor = self.optionsStyle?.optionsMenuDividerColor(self.optionsMenu) ?? defaultDividerColor
        self.popOverHighlightColor = self.optionsStyle?.optionsMenuHighlightColor(self.optionsMenu) ?? defaultHighlightColor
        
    }
    
}

extension HorizontalOptionsMenu : MenuPopOverViewDelegate {
    
    func popoverView(_ popoverView: MenuPopOverView!, didSelectItemAt index: Int){
        
        self.optionsDelegate?.optionsMenu(self.optionsMenu, didSelectOptionAtIndex: index)
        
    }
    
}


