

import Foundation
import Cocoa

class MenuBarItem {
    
    static let shared = MenuBarItem()
    var statusItem: NSStatusItem?
    public var menu: NSMenu? {
        didSet {
            statusItem?.menu = menu
        }
    }

    public func refreshVisibility() {
        if (Options.shared.showMenuBarIcon || true) {
            add()
        } else {
            remove()
        }
    }
    
    private func add() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "🖱️"
        statusItem?.menu = self.menu
    }
    
    private func remove() {
        guard let statusItem = statusItem else { return }
        NSStatusBar.system.removeStatusItem(statusItem)
    }
}

