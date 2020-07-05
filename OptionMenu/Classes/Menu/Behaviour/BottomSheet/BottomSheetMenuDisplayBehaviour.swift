//
//  BottomSheetMenuDisplayBehaviour.swift
//  Al-Mushaf
//
//  Created by Amr Elsayed on 7/31/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import MaterialComponents.MaterialBottomSheet

public class BottomSheetMenuDisplayBehaviour {
    unowned var optionsMenu: OptionsMenu!
    fileprivate var bottomSheetViewController: MDCBottomSheetController!
    private var optionsMenuContentViewControllerDelegate: OptionsMenuContentViewControllerDelegate?
        
    public init(optionsMenuContentViewControllerDelegate: OptionsMenuContentViewControllerDelegate = ListOptionsMenuContentViewControllerDelegate()) {
        self.optionsMenuContentViewControllerDelegate = optionsMenuContentViewControllerDelegate
    }
    
    private func initBottomSheetViewController(optionsMenu: OptionsMenu, preferedHeight: CGFloat = 0) {
        self.optionsMenu = optionsMenu
        if let contentViewController = self.optionsMenuContentViewControllerDelegate?
            .contentViewController(optionsMenu) {
            self.bottomSheetViewController = MDCBottomSheetController(contentViewController: contentViewController)
            setupPreferedSize(BottomSheetMenuDisplayBehaviour.initialSize(preferedHeight: preferedHeight))
        }
    }
    
    private func setupPreferedSize(_ preferedSize: CGSize) {
        self.bottomSheetViewController.preferredContentSize = preferedSize
    }
}

extension BottomSheetMenuDisplayBehaviour {
    static var isLandscape: Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
    
    static func initialSize(preferedHeight: CGFloat = 0) -> CGSize {
        return BottomSheetMenuDisplayBehaviour.preferredSize(
            isLandscape: isLandscape,
            screenWidth: UIScreen.main.bounds.width, preferedHeight: preferedHeight)
    }
    
    static func preferredSize(isLandscape: Bool, screenWidth:CGFloat, preferedHeight: CGFloat = 0) -> CGSize {
        var preferredSize: CGSize
        if isLandscape {
            preferredSize = landscapeSize(forScreenWidth: screenWidth)
        } else {
            preferredSize = portraitSize(forScreenWidth: screenWidth, preferedHeight: preferedHeight)
        }
        return preferredSize
    }
    
    private static func landscapeSize(forScreenWidth screenWidth: CGFloat)  -> CGSize {
        return CGSize(width: screenWidth / 2, height: CGFloat.greatestFiniteMagnitude)
    }
    
    private static func portraitSize(forScreenWidth screenWidth: CGFloat, preferedHeight: CGFloat) -> CGSize {
        return CGSize(width: screenWidth, height: preferedHeight)
    }
    
    private func initOrientationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(orientationDidChange(notification:)),
                                               name: .orientationDidChange,
                                               object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: .orientationDidChange, object: nil)
    }
    
    @objc private func orientationDidChange(notification: Notification){
        if let userInfo = notification.userInfo,
            let size = userInfo["size"] as? CGSize {
            if let isLandscape = userInfo["isLandscape"] as? Bool {
                let preferedSize = BottomSheetMenuDisplayBehaviour.preferredSize(
                    isLandscape: isLandscape, screenWidth: size.width)
                setupPreferedSize(preferedSize)
            }
        }
    }
}

extension BottomSheetMenuDisplayBehaviour : OptionsMenuDisplayBehaviour {
    public func display(_ optionsMenu: OptionsMenu, animated: Bool = true) {
        self.display(optionsMenu, animated: animated)
    }
    
    public func display(_ optionsMenu: OptionsMenu, animated: Bool = true, preferedHeight: CGFloat = 0) {
        initBottomSheetViewController(optionsMenu: optionsMenu, preferedHeight: preferedHeight)
        initOrientationObserver()
        optionsMenu.parentViewController
            .present(self.bottomSheetViewController,
                     animated: animated,
                     completion: nil)
    }
    
    public func dismiss(animated: Bool = true) {
        removeObserver()
        self.bottomSheetViewController.dismiss(animated: animated, completion: nil)
    }
}
