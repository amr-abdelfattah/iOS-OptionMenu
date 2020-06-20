//
//  OptionsMenuHelper.swift
//
//  Created by Amr Elsayed on 2/5/18.
//  Copyright © 2017 SmarTech. All rights reserved.
//

import UIKit

public extension UIViewController {
    public func showOptionsMenu(behaviour: OptionsMenuDisplayBehaviour,
                                dataSource: OptionsMenuDataSource,
                                delegate: OptionsMenuDelegate,
                                style: OptionsMenuStyle) {
        let optionsMenu = OptionsMenu(parentViewController: self)
        optionsMenu.behaviour =  behaviour
        optionsMenu.dataSource = dataSource
        optionsMenu.delegate = delegate
        optionsMenu.style = style
        optionsMenu.show(animated: true)
    }
}
