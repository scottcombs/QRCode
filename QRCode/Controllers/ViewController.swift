//
//  ViewController.swift
//  QRCode
//
//  Created by Scott on 12/12/18.
//  Copyright © 2018 Nutz & Boltz Productions. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
	@IBOutlet var model : Model?

	@IBOutlet var tabView: NSTabView!
	@IBOutlet var urlTextField: NSTextField!
	@IBOutlet var webView: WKWebView!
	@IBOutlet var firstNameTextField: NSTextField!
	@IBOutlet var lastNameTextField: NSTextField!
	@IBOutlet var companyTextField: NSTextField!
	@IBOutlet var emailHomeTextField: NSTextField!
	@IBOutlet var emailWorkTextField: NSTextField!
	@IBOutlet var telHomeTextField: NSTextField!
	@IBOutlet var telWorkTextField: NSTextField!
	@IBOutlet var faxHomeTextField: NSTextField!
	@IBOutlet var faxWorkTextField: NSTextField!
	@IBOutlet var streetAddrHomeTextField: NSTextField!
	@IBOutlet var cityAddrHomeTextField: NSTextField!
	@IBOutlet var stateAddrHomeTextField: NSTextField!
	@IBOutlet var zipAddrHomeTextField: NSTextField!
	@IBOutlet var countryAddrHomeTextField: NSTextField!
	@IBOutlet var streetAddrWorkTextField: NSTextField!
	@IBOutlet var cityAddrWorkTextField: NSTextField!
	@IBOutlet var stateAddrWorkTextField: NSTextField!
	@IBOutlet var zipAddrWorkTextField: NSTextField!
	@IBOutlet var countryWorkTextField: NSTextField!
	@IBOutlet var urlVCardTextField: NSTextField!
	@IBOutlet var telNumberTextField: NSTextField!
	@IBOutlet var emailAddrTextField: NSTextField!
	@IBOutlet var subjectTextField: NSTextField!
	@IBOutlet var contentTextView: NSTextView!
	@IBOutlet var qrcImageView: NSImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		if let m = self.model {
			urlTextField.stringValue = m.urlTextFieldString
			firstNameTextField.stringValue = m.firstNameTextFieldString
			lastNameTextField.stringValue = m.lastNameTextFieldString
			companyTextField.stringValue = m.companyTextFieldString
			emailHomeTextField.stringValue = m.emailHomeTextFieldString
			emailWorkTextField.stringValue = m.emailWorkTextFieldString
			telHomeTextField.stringValue = m.telHomeTextFieldString
			telWorkTextField.stringValue = m.telWorkTextFieldString
			faxHomeTextField.stringValue = m.faxHomeTextFieldString
			faxWorkTextField.stringValue = m.faxWorkTextFieldString
			streetAddrHomeTextField.stringValue = m.streetAddrHomeTextFieldString
			cityAddrHomeTextField.stringValue = m.cityAddrHomeTextFieldString
			stateAddrHomeTextField.stringValue = m.stateAddrHomeTextFieldString
			zipAddrHomeTextField.stringValue = m.zipAddrHomeTextFieldString
			countryAddrHomeTextField.stringValue = m.countryAddrHomeTextFieldString
			streetAddrWorkTextField.stringValue = m.streetAddrWorkTextFieldString
			cityAddrWorkTextField.stringValue = m.cityAddrWorkTextFieldString
			stateAddrWorkTextField.stringValue = m.stateAddrWorkTextFieldString
			zipAddrWorkTextField.stringValue = m.zipAddrWorkTextFieldString
			countryWorkTextField.stringValue = m.countryWorkTextFieldString
			urlVCardTextField.stringValue = m.urlVCardTextFieldString
			telNumberTextField.stringValue = m.telNumberTextFieldString
			emailAddrTextField.stringValue = m.emailAddrTextFieldString
			subjectTextField.stringValue = m.subjectTextFieldString
			contentTextView.string = m.contentTextViewString
			qrcImageView.image = m.qrcImage
			tabView.selectTabViewItem(at: m.tabIndex.intValue)
		}
	}

	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
			self.model = self.representedObject as? Model

			urlTextField.stringValue = self.model!.urlTextFieldString
			firstNameTextField.stringValue = self.model!.firstNameTextFieldString
			lastNameTextField.stringValue = self.model!.lastNameTextFieldString
			companyTextField.stringValue = self.model!.companyTextFieldString
			emailHomeTextField.stringValue = self.model!.emailHomeTextFieldString
			emailWorkTextField.stringValue = self.model!.emailWorkTextFieldString
			telHomeTextField.stringValue = self.model!.telHomeTextFieldString
			telWorkTextField.stringValue = self.model!.telWorkTextFieldString
			faxHomeTextField.stringValue = self.model!.faxHomeTextFieldString
			faxWorkTextField.stringValue = self.model!.faxWorkTextFieldString
			streetAddrHomeTextField.stringValue = self.model!.streetAddrHomeTextFieldString
			cityAddrHomeTextField.stringValue = self.model!.cityAddrHomeTextFieldString
			stateAddrHomeTextField.stringValue = self.model!.stateAddrHomeTextFieldString
			zipAddrHomeTextField.stringValue = self.model!.zipAddrHomeTextFieldString
			countryAddrHomeTextField.stringValue = self.model!.countryAddrHomeTextFieldString
			streetAddrWorkTextField.stringValue = self.model!.streetAddrWorkTextFieldString
			cityAddrWorkTextField.stringValue = self.model!.cityAddrWorkTextFieldString
			stateAddrWorkTextField.stringValue = self.model!.stateAddrWorkTextFieldString
			zipAddrWorkTextField.stringValue = self.model!.zipAddrWorkTextFieldString
			countryWorkTextField.stringValue = self.model!.countryWorkTextFieldString
			urlVCardTextField.stringValue = self.model!.urlVCardTextFieldString
			telNumberTextField.stringValue = self.model!.telNumberTextFieldString
			emailAddrTextField.stringValue = self.model!.emailAddrTextFieldString
			subjectTextField.stringValue = self.model!.subjectTextFieldString
			contentTextView.string = self.model!.contentTextViewString
			qrcImageView.image = self.model!.qrcImage
			tabView.selectTabViewItem(at: self.model!.tabIndex.intValue)
		}
	}

	@IBAction func urlTextFieldChanged(_ sender: Any) {
		if let myURL = URL(string:self.urlTextField.stringValue) {
			webView.load(URLRequest(url: myURL))
		}
	}

	@IBAction func generateClicked(_ sender: Any) {
		switch self.tabView.selectedIndex {
		case 0: // URL
			self.URLGenerator(sender)
		case 1: // VCard
			self.VCardGenerator(sender)
		case 2: // Phone
			self.PhoneGenerator(sender)
		default: // EMail
			self.EMailGenerator(sender)
		}
	}

	func createImage(data : NSData!){
		let filter = CIFilter(name: "CIQRCodeGenerator")

		filter!.setValue(data, forKey: "inputMessage")
		filter!.setValue("H", forKey: "inputCorrectionLevel")

		let qrcodeImage = filter!.outputImage

		let scaleX = qrcImageView.frame.size.width / qrcodeImage!.extent.size.width
		let scaleY = qrcImageView.frame.size.height / qrcodeImage!.extent.size.height

		let transformedImage = qrcodeImage!.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

		let rep: NSCIImageRep = NSCIImageRep(ciImage: transformedImage)
		let nsImage: NSImage = NSImage(size: rep.size)
		nsImage.addRepresentation(rep)
		self.qrcImageView.image = nsImage
		self.model?.qrcImage = nsImage
	}

	@IBAction func URLGenerator(_ sender: Any) {
		let data : NSData = self.urlTextField.stringValue.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)! as NSData

		self.createImage(data: data)

	}

	@IBAction func VCardGenerator(_ sender: Any) {
		/****
		BEGIN:VCARD
		VERSION:3.0
		PRODID:-//Apple Inc.//Mac OS X 10.14.2//EN
		N:Ventura;Ace;;;
		FN:Ace Ventura
		ORG:ACME Company;
		EMAIL;type=INTERNET;type=HOME;type=pref:first@acme.com
		EMAIL;type=INTERNET;type=WORK:last@acme.com
		TEL;type=HOME;type=VOICE;type=pref:1 (234) 567-8901
		TEL;type=CELL;type=VOICE:12345678901
		TEL;type=WORK;type=VOICE:1 (234) 567-8901
		TEL;type=HOME;type=FAX:1 (234) 567-8901
		TEL;type=WORK;type=FAX:1 (234) 567-8901
		ADR;type=HOME;type=pref:;;123 Street Rd.;City;AZ;12345;USA
		ADR;type=WORK:;;456 Street Ave.;City;AZ;12345;USA
		item1.URL;type=pref:abc.com
		item1.X-ABLabel:_$!<HomePage>!$_
		UID:24083e04-c933-4b20-92ce-d9a01574f69d
		X-ABUID:D3642E00-66C7-4FD2-B443-9267CEA243FF:ABPerson
		END:VCARD
		****/

		var string : String = ""

		string += "BEGIN:VCARD\n"
		string += "VERSION:3.0\n"
		string += "PRODID:-//Apple Inc.//Mac OS X 10.14.2//EN\n"
		if !firstNameTextField.stringValue.isEmpty &&
			!lastNameTextField.stringValue.isEmpty {
			string += "N:"
			string += lastNameTextField.stringValue
			string += ";"
			string += firstNameTextField.stringValue
			string += ";;;\n"
			string += "FN:"
			string += firstNameTextField.stringValue
			string += " "
			string += lastNameTextField.stringValue
			string += "\n"
		}
		if !companyTextField.stringValue.isEmpty {
			string += "ORG:"
			string += companyTextField.stringValue
			string += ";\n"
		}
		if !emailHomeTextField.stringValue.isEmpty {
			string += "EMAIL;type=INTERNET;type=HOME:"
			string += emailHomeTextField.stringValue
			string += "\n"
		}
		if !emailWorkTextField.stringValue.isEmpty {
			string += "EMAIL;type=INTERNET;type=WORK:"
			string += emailWorkTextField.stringValue
			string += "\n"
		}
		if !telHomeTextField.stringValue.isEmpty {
			string += "TEL;type=HOME;type=VOICE:"
			string += telHomeTextField.stringValue
			string += "\n"
		}
		if !telWorkTextField.stringValue.isEmpty {
			string += "TEL;type=WORK;type=VOICE:"
			string += telWorkTextField.stringValue
			string += "\n"
		}
		if !faxHomeTextField.stringValue.isEmpty {
			string += "TEL;type=HOME;type=FAX:"
			string += faxHomeTextField.stringValue
			string += "\n"
		}
		if !faxWorkTextField.stringValue.isEmpty {
			string += "TEL;type=WORK;type=FAX:"
			string += faxWorkTextField.stringValue
			string += "\n"
		}
		if !streetAddrHomeTextField.stringValue.isEmpty &&
			!cityAddrHomeTextField.stringValue.isEmpty &&
			!stateAddrHomeTextField.stringValue.isEmpty &&
			!zipAddrHomeTextField.stringValue.isEmpty &&
			!countryAddrHomeTextField.stringValue.isEmpty {
			string += "ADR;type=HOME:;;"
			string += streetAddrHomeTextField.stringValue
			string += ";"
			string += cityAddrHomeTextField.stringValue
			string += ";"
			string += stateAddrHomeTextField.stringValue
			string += ";"
			string += zipAddrHomeTextField.stringValue
			string += ";"
			string += countryAddrHomeTextField.stringValue
			string += "\n"
		}
		if !streetAddrWorkTextField.stringValue.isEmpty &&
			!cityAddrWorkTextField.stringValue.isEmpty &&
			!stateAddrWorkTextField.stringValue.isEmpty &&
			!zipAddrWorkTextField.stringValue.isEmpty &&
			!countryWorkTextField.stringValue.isEmpty {
			string += "ADR;type=WORK:;;"
			string += streetAddrWorkTextField.stringValue
			string += ";"
			string += cityAddrWorkTextField.stringValue
			string += ";"
			string += stateAddrWorkTextField.stringValue
			string += ";"
			string += zipAddrWorkTextField.stringValue
			string += ";"
			string += countryWorkTextField.stringValue
			string += "\n"
		}

		string += "UID:"
		string += UUID().uuidString
		string += "\n"
		string += "X-ABUID:"
		string += UUID().uuidString
		string += "\n"
		string += "END:VCARD"

		let data : NSData = string.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)! as NSData

		self.createImage(data: data)
	}

	@IBAction func PhoneGenerator(_ sender: Any) {
		let string : String = "tel:" + self.telNumberTextField.stringValue

		let data : NSData = string.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)! as NSData

		self.createImage(data: data)
	}

	@IBAction func EMailGenerator(_ sender: Any) {
		let emailAddrString = "mailto:" + self.emailAddrTextField.stringValue

		// ?subject
		var subjectString : String = ""
		if !subjectTextField.stringValue.isEmpty {
			subjectString = "?subject="
			subjectString += subjectTextField.stringValue
		}

		// &body
		var bodyString : String = ""
		if !contentTextView.string.isEmpty {
			bodyString = "&body="
			bodyString += contentTextView.string
		}

		let string : String = emailAddrString + subjectString + bodyString

		let data : NSData = string.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)! as NSData

		self.createImage(data: data)
	}

	@IBAction func exportQRCode(_ sender : Any) {
		let panel : NSSavePanel = NSSavePanel()
		panel.showsHiddenFiles = false
		panel.allowedFileTypes = ["png"]
		panel.title = "Export QR Code File"
		panel.prompt = "Save a PNG file."

		panel.beginSheetModal(for: self.view.window!) { (response) in
			if response == NSApplication.ModalResponse.OK {
				do{
					let tiffRepresentation = self.qrcImageView.image!.tiffRepresentation
					let bitmapImage = NSBitmapImageRep(data: tiffRepresentation!)
					let data = bitmapImage!.representation(using: .png, properties: [:])
					try data!.write(to: panel.url!, options: .atomic)
				}catch{}
			}
		}
	}

	@IBAction func printQRCode(_ sender: Any){
		self.qrcImageView.printView(sender)
	}
}

extension NSTabView {
	var selectedIdentifier : Any?  { return self.selectedTabViewItem?.identifier }

	var selectedIndex : Int {
		return self.indexOfTabViewItem(self.selectedTabViewItem!)
	}
}
