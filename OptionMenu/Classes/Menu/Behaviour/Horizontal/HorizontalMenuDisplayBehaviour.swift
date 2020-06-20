//
//  HorizontalMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 8/5/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import UIKit

public class HorizontalMenuDisplayBehaviour {
    var horizontalOptionsMenu : HorizontalOptionsMenu!
    let popOverPoint : CGPoint
    
    init(popOverPoint: CGPoint) {
        self.popOverPoint = popOverPoint
    }
    
    func initOptionsContainerViewController(_ optionsMenu : OptionsMenu) {
        self.horizontalOptionsMenu = HorizontalOptionsMenu()
        self.horizontalOptionsMenu.optionsMenu = optionsMenu
    }
}

extension HorizontalMenuDisplayBehaviour : OptionsMenuDisplayBehaviour {
    public func display(_ optionsMenu: OptionsMenu, animated: Bool) {
        initOptionsContainerViewController(optionsMenu)
        self.horizontalOptionsMenu.presentPopover(
            from: CGRect(origin: popOverPoint, size: CGSize.zero),
            in: optionsMenu.parentViewController.view,
            withStrings: (optionsMenu.dataSource as? HorizontalListOptionsMenuDataSource)?
                .optionsTitles(optionsMenu))
        self.horizontalOptionsMenu.becomeFirstResponder()
    }
    
    public func dismiss(animated: Bool) {
    }
}
