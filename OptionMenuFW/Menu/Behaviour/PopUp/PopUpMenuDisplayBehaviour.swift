//
//  PopUpMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by admin on 8/1/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import Foundation

public class PopUpMenuDisplayBehaviour {
 
    ///var optionsContainerViewController : VerseOptionsViewController!
    
    func initOptionsContainerViewController(_ optionsMenu : OptionsMenu) {
        
        // NEED to create content View controller for this Behaviour
        //self.optionsContainerViewController =  Constants.mainStoryBoard?.instantiateViewController(withIdentifier: "VerseOptionsViewController") as? VerseOptionsViewController
       /* self.optionsContainerViewController.optionsMenu = optionsMenu
        self.optionsContainerViewController.modalPresentationStyle = .overCurrentContext
        self.optionsContainerViewController.modalTransitionStyle = .crossDissolve
        self.optionsContainerViewController.showHorizontalMenu = false*/
        
    }
    
}

extension PopUpMenuDisplayBehaviour : OptionsMenuDisplayBehaviour {
    
    public func display(_ optionsMenu: OptionsMenu, animated: Bool) {
        
        initOptionsContainerViewController(optionsMenu)
       /* optionsMenu.parentViewController.present(self.optionsContainerViewController, animated: animated, completion: nil)*/
        
    }
    
    public func dismiss(animated: Bool) {
        
      /*  self.optionsContainerViewController.dismiss(animated: true)*/
    }
    
}
