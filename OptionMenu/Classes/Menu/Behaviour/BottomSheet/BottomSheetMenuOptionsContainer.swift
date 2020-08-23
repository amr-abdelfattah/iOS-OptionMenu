//
//  VerseOptionsViewController2.swift
//  Makka
//
//  Created by Amr Elsayed on 7/30/18.
//  Copyright © 2018 SmarTech. All rights reserved.
//

import UIKit
import Localize_Swift

class BottomSheetMenuOptionsContainer : UITableViewController {
    private let defaultUnselectedTintColor = UIColor(hex: "444444")
    private let defaultSelectedTintColor = UIColor(hex: "d7b93e")
    private let defaultUnselectedTextColor = UIColor(hex: "444444")
    private let defaultSelectedTextColor = UIColor(hex: "d7b93e")
    private let defaultItemBackgroundColor = UIColor(hex: "eeeeee")
    private let defaultItemHighlightColor = UIColor.clear
    
    private let defaultBackgroundColor = UIColor(hex: "eeeeee")
    private let defaultHeaderBackgroundColor = UIColor(hex: "eeeeee")
    private let defaultTitleColor = UIColor(hex: "777777")
    
    private let defaultHolderColor = UIColor(hex: "faf9f3").withAlphaComponent(0.7)
    
    private let defaultHeaderHeight = 32
    
    @IBOutlet var headerView : UIView!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var holderImageView : UIImageView!
    
    private weak var dataSource: ListOptionsMenuDataSource?
    private weak var delegate: ListOptionsMenuDelegate?
    private weak var style: ListOptionsMenuStyle?
    
    var currentSize : CGSize!
    unowned var optionsMenu: OptionsMenu! {
        didSet {
            initProtocols()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCurrentSize()
        initTheme()
        initLanguageDirection()
        initTitle()
        initTablePropreties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initOrientationObserver()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObserver()
    }
    
    func initCurrentSize() {
        self.currentSize = BottomSheetMenuDisplayBehaviour.initialSize()
    }
    
    func initProtocols()  {
        self.dataSource = self.optionsMenu.dataSource as? ListOptionsMenuDataSource
        self.delegate = self.optionsMenu.delegate as? ListOptionsMenuDelegate
        self.style = self.optionsMenu.style as? ListOptionsMenuStyle
    }
    
    func initTheme() {
        initColors()
        initFonts()
    }
    
    func initColors() {
        self.view.backgroundColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.clear
        initHeaderColor()
    }
    
    func initHeaderColor() {
        self.headerView.backgroundColor = UIColor.clear
        initHolderImageViewColor()
        self.titleLabel.textColor = self.style?
            .optionsMenuHeaderTintColor(self.optionsMenu) ?? defaultTitleColor
        
        self.titleLabel.backgroundColor = self.style?
            .optionsMenuHeaderBackgroundColor(self.optionsMenu) ?? defaultHeaderBackgroundColor
    }
    
    func initHolderImageViewColor() {
        self.holderImageView.backgroundColor = self.style?
            .optionsMenuHolderTintColor(self.optionsMenu) ?? defaultHolderColor
    }
    
    func initFonts() {
        self.titleLabel.font = self.style?.optionsMenuTitleFont(self.optionsMenu)
    }
    
    func initLanguageDirection() {
        if Localize.isRTL {
            self.tableView.semanticContentAttribute = .forceRightToLeft
        } else {
            self.tableView.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    func initTitle() {
        var headerText = (self.dataSource?.optionsMenuTitle(self.optionsMenu) ?? "")
        if let subTitle = self.dataSource?.optionsMenuSubtitle(self.optionsMenu) {
            headerText.append(" ( \(subTitle) )")
        }
        self.titleLabel.text = headerText
    }
    
    func initTablePropreties() {
        self.tableView.bounces = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        if let sepratorColor = self.style?.optionsMenuDividerColor(self.optionsMenu) {
            self.tableView.separatorColor = sepratorColor
        }
    }
    
    func addBackgroundView() {
        let tag = 999
        if let backgroudView = view.viewWithTag(tag) {
            backgroudView.removeFromSuperview()
        }
        tableView.layoutIfNeeded()
        let backgroudView = UIView(frame: CGRect(x: 0, y: tableView.contentSize.height, width: view.frame.width, height: UIApplication.shared.safeArea.bottom + headerHeight()))
        backgroudView.tag = tag
        backgroudView.backgroundColor = self.style?
            .optionsMenuBackgroundColor(optionsMenu) ?? defaultBackgroundColor
        view.insertSubview(backgroudView, at: 0)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    }
}

extension BottomSheetMenuOptionsContainer {
    private func initOrientationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange(notification:)), name: .orientationDidChange, object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: .orientationDidChange, object: nil)
    }
    
    @objc private func orientationDidChange(notification: Notification){
        if let userInfo = notification.userInfo,
            let size = userInfo["size"] as? CGSize {
            if let isLandscape = userInfo["isLandscape"] as? Bool {
                self.currentSize = BottomSheetMenuDisplayBehaviour.preferredSize(
                    isLandscape: isLandscape, screenWidth: size.width)
            }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
    }
}

extension BottomSheetMenuOptionsContainer {
    func roundCorners(label: UILabel, roundedRect: CGRect, corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        label.layer.mask = mask
    }
}

extension BottomSheetMenuOptionsContainer {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.optionsCount(self.optionsMenu) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OptionMenuCell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        let index = indexPath.row
        if let menuItem = self.dataSource!.optionsMenu(self.optionsMenu, optionAtIndex: index) {
            let tintColor = self.style?
                .optionsMenu(self.optionsMenu, tintColorForItemAtIndex: index)
                ?? (menuItem.selected ? defaultSelectedTintColor : defaultUnselectedTintColor)
            let textColor = menuItem.selected ?
                (self.style?.optionsMenu(self.optionsMenu, selectedTintColorForItemAtIndex: index)
                    ?? defaultSelectedTextColor)
                : (self.style?.optionsMenu(self.optionsMenu, tintColorForItemAtIndex: index)
                    ?? defaultUnselectedTextColor)
            cell.textLabel?.text = menuItem.title
            cell.textLabel?.textColor = textColor
            cell.textLabel?.textAlignment = Localize.isRTL ? .right : .left
            cell.textLabel?.font = self.style?.optionsMenu(self.optionsMenu, fontForItemAtIndex: index)
            cell.imageView?.image = UIImage(named: menuItem.imageName ?? "")
            cell.imageView?.tintColor = tintColor
            cell.backgroundColor = self.style?.optionsMenu(self.optionsMenu, backgroundColorForItemAtIndex: index) ?? defaultItemBackgroundColor
            let colorView = UIView()
            colorView.backgroundColor = self.style?.optionsMenu(self.optionsMenu, highlightColorForItemAtIndex: index) ?? defaultItemHighlightColor
            cell.selectedBackgroundView = colorView
        }
        addBackgroundView()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.roundCorners(label: titleLabel, roundedRect: CGRect(x: 0, y: 0, width: self.currentSize.width, height: headerHeight()),corners: [.topRight, .topLeft], radius: 10)
        return self.headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight()
    }
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        var backgroundColor = defaultItemBackgroundColor
//        if let color = self.style?.optionsMenu(self.optionsMenu, backgroundColorForItemAtIndex: 0) {
//             backgroundColor = color
//        }
//        footerView.backgroundColor = backgroundColor
//        return footerView
//    }
    
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return UIApplication.shared.safeArea.bottom
//    }
    
    private func headerHeight() -> CGFloat {
        var headerHeight : CGFloat = CGFloat(defaultHeaderHeight)
        if let _ = self.dataSource?.optionsMenuTitle(self.optionsMenu) {
            headerHeight = self.headerView.frame.height
        }
        return headerHeight
    }
}

extension BottomSheetMenuOptionsContainer {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.optionsMenu(optionsMenu, didSelectOptionAtIndex: indexPath.row)
    }
}
