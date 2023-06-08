import AppKit

class StatusBarMenu: NSObject {

    var statusBarItem: NSStatusItem!
    
    override init() {
        super.init()
        
        initStatusBarItem()
    }
    
    // 初始化状态栏Button
    func initStatusBarItem() {
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.squareLength))
        if let button = self.statusBarItem.button {
            button.image = NSImage(named: "menubar")
            button.image?.size = NSSize(width: 18.0, height: 18.0)
            button.image?.isTemplate = true
            button.action = #selector(AppDelegate.instance.togglePop)
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
    }
}

