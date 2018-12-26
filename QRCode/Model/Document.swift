//
//  Document.swift
//  QRCode
//
//  Created by Scott on 12/12/18.
//  Copyright © 2018 Nutz & Boltz Productions. All rights reserved.
//

import Cocoa

class Document: NSDocument {
	var model : Model?

	override init() {
	    super.init()
		// Add your subclass-specific initialization here.
		self.model = Model(with: self)
	}

	override class var autosavesInPlace: Bool {
		return true
	}

	override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
		let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
		let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController

		// Set the Window Controller into the Model
		self.model?.windowController = windowController

		// Set the model to the View Controller
		windowController.contentViewController?.representedObject = self.model

		self.addWindowController(windowController)
	}

	override func data(ofType typeName: String) throws -> Data {
		if typeName == "qrcode" {
			return try	NSKeyedArchiver.archivedData(withRootObject: self.model!, requiringSecureCoding: false)
		}else{
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
	}

	override func read(from data: Data, ofType typeName: String) throws {
		if typeName == "qrcode" {
			if let aModel : Model = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Model {
				// Set specific data from model
				// DO NOT SET model.document & model.windowController

				// Migrate values from local Model to self's Model
				self.model?.urlTextFieldString = aModel.urlTextFieldString
				self.model?.firstNameTextFieldString = aModel.firstNameTextFieldString
				self.model?.lastNameTextFieldString = aModel.lastNameTextFieldString
				self.model?.companyTextFieldString = aModel.companyTextFieldString
				self.model?.emailHomeTextFieldString = aModel.emailHomeTextFieldString
				self.model?.emailWorkTextFieldString = aModel.emailWorkTextFieldString
				self.model?.telHomeTextFieldString = aModel.telHomeTextFieldString
				self.model?.telWorkTextFieldString = aModel.telWorkTextFieldString
				self.model?.faxHomeTextFieldString = aModel.faxHomeTextFieldString
				self.model?.faxWorkTextFieldString = aModel.faxWorkTextFieldString
				self.model?.streetAddrHomeTextFieldString = aModel.streetAddrHomeTextFieldString
				self.model?.cityAddrHomeTextFieldString = aModel.cityAddrHomeTextFieldString
				self.model?.stateAddrHomeTextFieldString = aModel.stateAddrHomeTextFieldString
				self.model?.zipAddrHomeTextFieldString = aModel.zipAddrHomeTextFieldString
				self.model?.countryAddrHomeTextFieldString = aModel.countryAddrHomeTextFieldString
				self.model?.streetAddrWorkTextFieldString = aModel.streetAddrWorkTextFieldString
				self.model?.cityAddrWorkTextFieldString = aModel.cityAddrWorkTextFieldString
				self.model?.stateAddrWorkTextFieldString = aModel.stateAddrWorkTextFieldString
				self.model?.zipAddrWorkTextFieldString = aModel.zipAddrWorkTextFieldString
				self.model?.countryWorkTextFieldString = aModel.countryWorkTextFieldString
				self.model?.urlVCardTextFieldString = aModel.urlVCardTextFieldString
				self.model?.telNumberTextFieldString = aModel.telNumberTextFieldString
				self.model?.emailAddrTextFieldString = aModel.emailAddrTextFieldString
				self.model?.subjectTextFieldString = aModel.subjectTextFieldString
				self.model?.contentTextViewString = aModel.contentTextViewString
				self.model?.qrcImage = aModel.qrcImage
				self.model?.tabIndex = aModel.tabIndex
				
				// Set the View Controller's representedObject to the new Model
				self.model?.windowController?.contentViewController?.representedObject = self.model
			}
		}else{
			throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
		}
	}
}

