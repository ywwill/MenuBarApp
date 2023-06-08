import Cocoa

class PopWindowController: NSWindowController {
    
    override var windowNibName: NSNib.Name {
        return NSNib.Name("PopWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
     
        window?.isMovable = false
    }
}
