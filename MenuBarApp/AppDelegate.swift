import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    static private(set) var instance: AppDelegate! = nil
    var statusMenu: StatusBarMenu?
    lazy var popWindowController = PopWindowController()
    var showPopWindow = false
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        AppDelegate.instance = self
        self.statusMenu = StatusBarMenu()
        
        NotificationCenter.default.addObserver(forName: NSWindow.didResignKeyNotification, object: nil, queue: OperationQueue.main) { _ in
            self.togglePop()
        }

        NotificationCenter.default.addObserver(forName: NSWindow.didResignMainNotification, object: nil, queue: OperationQueue.main) { _ in
            self.togglePop()
        }
    }

    @objc func togglePop() {
        
        if !showPopWindow {
            // 计算窗口的位置
            if let event = NSApp.currentEvent, let window = event.window, let popWindow = popWindowController.window  {
                let eventFrame = window.frame
                let eventOrigin = eventFrame.origin
                
                let popWindowTopLeftPosition = CGPoint(x: eventOrigin.x, y: eventOrigin.y)
                popWindow.setFrameTopLeftPoint(popWindowTopLeftPosition)
                popWindow.makeKeyAndOrderFront(self)
                NSApp.activate(ignoringOtherApps: true)
                showPopWindow = true
            }
        } else {
            if let popWindow = popWindowController.window {
                popWindow.orderOut(nil)
                showPopWindow = false
            }
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

