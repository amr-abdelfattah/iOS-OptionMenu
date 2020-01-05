//
//  OptionsMenuContentViewController.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 8/13/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation
import UIKit

public protocol OptionsMenuContentViewControllerDelegate {
    
    func contentViewController(_ optionsMenu: OptionsMenu) -> UIViewController?
    
}
