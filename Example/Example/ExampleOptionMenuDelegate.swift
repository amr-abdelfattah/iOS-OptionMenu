//
//  ExampleOptionMenuDelegate.swift
//  OptionMenu_Tests
//
//  Created by Amr Elsayed on 1/5/20.
//  Copyright © 2020 Amr Elsayed. All rights reserved.
//

import OptionMenu

class ExampleOptionMenuDelegate: ListOptionsMenuDelegate {
    func optionsMenu(_ optionsMenu: OptionsMenu, didSelectOptionAtIndex index: Int) {
        print("Did select item at \(index)")
    }
}
