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
    
    private func initBottomSheetViewController(optionsMenu: OptionsMenu) {
        self.optionsMenu = optionsMenu
        if let contentViewController = self.optionsMenuContentViewControllerDelegate?
            .contentViewController(optionsMenu) {
            self.bottomSheetViewController = MDCBottomSheetController(contentViewController: contentViewController)
            setupPreferedSize(BottomSheetMenuDisplayBehaviour.initialSize)
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
    
    static var initialSize : CGSize {
        return BottomSheetMenuDisplayBehaviour.preferredSize(
            isLandscape: isLandscape,
            screenWidth: UIScreen.main.bounds.width)
    }
    
    static func preferredSize(isLandscape: Bool, screenWidth:CGFloat) -> CGSize {
        var preferredSize: CGSize
        if isLandscape {
            preferredSize = landscapeSize(forScreenWidth: screenWidth)
        } else {
            preferredSize = portraitSize(forScreenWidth: screenWidth)
        }
        return preferredSize
    }
    
    private static func landscapeSize(forScreenWidth screenWidth: CGFloat)  -> CGSize {
        return CGSize(width: screenWidth / 2, height: CGFloat.greatestFiniteMagnitude)
    }
    
    private static func portraitSize(forScreenWidth screenWidth: CGFloat) -> CGSize {
        return CGSize(width: screenWidth, height: 0)
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
        initBottomSheetViewController(optionsMenu: optionsMenu)
        initOrientationObserver()
        optionsMenu.parentViewController.present(self.bottomSheetViewController,
                                                 animated: animated,
                                                 completion: nil)
    }
    
    public func dismiss(animated: Bool = true) {
        removeObserver()
        self.bottomSheetViewController.dismiss(animated: animated, completion: nil)
    }
}
