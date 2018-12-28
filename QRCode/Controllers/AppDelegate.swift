//
//  AppDelegate.swift
//  QRCode
//
//  Created by Scott on 12/12/18.
//  Copyright © 2018 Nutz & Boltz Productions. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	func application(_ application: NSApplication, open urls: [URL]) {
		// Handle launching files from the Finder
		for url in urls {
			do{
				let doc = Document()
				doc.makeWindowControllers()
				try doc.read(from: url, ofType: "qrcode")
				doc.fileURL = url
				doc.model?.windowController?.showWindow(self)
			}catch{ }
		}
	}

	func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
		// App will not create an empty file automatically
		return false
	}

	@IBAction func open(_ sender: Any?){
		// First Responder to open a file
		let panel : NSOpenPanel = NSOpenPanel()
		panel.canChooseFiles = true
		panel.canChooseDirectories = false
		panel.allowsMultipleSelection = false
		panel.showsHiddenFiles = false
		panel.allowedFileTypes = ["qrcode"]
		panel.title = "Open QRC File"

		panel.begin { (response) in
			if response == NSApplication.ModalResponse.OK {
				do{
					let doc = Document()
					doc.makeWindowControllers()
					try doc.read(from: panel.url!, ofType: "qrcode")
					doc.fileURL = panel.url!
					doc.model?.windowController?.showWindow(self)
				}catch{}
			}
		}
	}

	@IBAction func save(_ sender: Any?) {
		// First Responder to save a file
		if let wc = NSApp.keyWindow?.windowController {
			if let document = wc.document as? Document {
				if document.fileURL != nil {
					do{
						let data : Data = try document.data(ofType: "qrcode")
						try data.write(to: document.fileURL!)
						document.updateChangeCount(NSDocument.ChangeType.changeDone)
					}catch{}
				}else{
					self.saveAs(sender)
				}
			}
		}
	}

	@IBAction func saveAs(_ sender: Any?) {
		if let wc = NSApp.keyWindow?.windowController {
			if let document = wc.document as? Document {
				let panel : NSSavePanel = NSSavePanel()
				panel.showsHiddenFiles = false
				panel.allowedFileTypes = ["qrcode"]
				panel.title = "Save File"
				panel.prompt = "Save a QRC file"

				panel.beginSheetModal(for: (document.model?.windowController?.window)!) { (response) in
					if response == NSApplication.ModalResponse.OK {
						if let document = wc.document as? Document {
							do{
								let data : Data = try document.data(ofType: "qrcode")
								try data.write(to: panel.url!)
								document.fileURL = panel.url!
								document.updateChangeCount(NSDocument.ChangeType.changeDone
							}catch{}
						}
					}
				}
			}
		}
	}

	
}

