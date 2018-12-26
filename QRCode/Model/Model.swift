//
//  Model.swift
//  QRCode
//
//  Created by Scott on 12/12/18.
//  Copyright © 2018 Nutz & Boltz Productions. All rights reserved.
//

import Cocoa

class Model: NSObject, NSCoding {
	// Internal Non-Saving Properties
	var document : Document?
	var windowController : NSWindowController?

	// App specific Saving Properties
	@IBOutlet var urlTextFieldString : String!
	@IBOutlet var firstNameTextFieldString : String!
	@IBOutlet var lastNameTextFieldString : String!
	@IBOutlet var companyTextFieldString : String!
	@IBOutlet var emailHomeTextFieldString : String!
	@IBOutlet var emailWorkTextFieldString : String!
	@IBOutlet var telHomeTextFieldString : String!
	@IBOutlet var telWorkTextFieldString : String!
	@IBOutlet var faxHomeTextFieldString : String!
	@IBOutlet var faxWorkTextFieldString : String!
	@IBOutlet var streetAddrHomeTextFieldString : String!
	@IBOutlet var cityAddrHomeTextFieldString : String!
	@IBOutlet var stateAddrHomeTextFieldString : String!
	@IBOutlet var zipAddrHomeTextFieldString : String!
	@IBOutlet var countryAddrHomeTextFieldString : String!
	@IBOutlet var streetAddrWorkTextFieldString : String!
	@IBOutlet var cityAddrWorkTextFieldString : String!
	@IBOutlet var stateAddrWorkTextFieldString : String!
	@IBOutlet var zipAddrWorkTextFieldString : String!
	@IBOutlet var countryWorkTextFieldString : String!
	@IBOutlet var urlVCardTextFieldString : String!
	@IBOutlet var telNumberTextFieldString : String!
	@IBOutlet var emailAddrTextFieldString : String!
	@IBOutlet var subjectTextFieldString : String!
	@IBOutlet var contentTextViewString : String!
	@IBOutlet var qrcImage : NSImage!
	@IBOutlet var tabIndex : NSNumber! = NSNumber(value: 0)

	// Convenience Initializer
	init(with document: Document) {
		super.init()
		self.document = document

		self.urlTextFieldString = ""
		self.firstNameTextFieldString = ""
		self.lastNameTextFieldString = ""
		self.companyTextFieldString = ""
		self.emailHomeTextFieldString = ""
		self.emailWorkTextFieldString = ""
		self.telHomeTextFieldString = ""
		self.telWorkTextFieldString = ""
		self.faxHomeTextFieldString = ""
		self.faxWorkTextFieldString = ""
		self.streetAddrHomeTextFieldString = ""
		self.cityAddrHomeTextFieldString = ""
		self.stateAddrHomeTextFieldString = ""
		self.zipAddrHomeTextFieldString = ""
		self.countryAddrHomeTextFieldString = ""
		self.streetAddrWorkTextFieldString = ""
		self.cityAddrWorkTextFieldString = ""
		self.stateAddrWorkTextFieldString = ""
		self.zipAddrWorkTextFieldString = ""
		self.countryWorkTextFieldString = ""
		self.urlVCardTextFieldString = ""
		self.telNumberTextFieldString = ""
		self.emailAddrTextFieldString = ""
		self.subjectTextFieldString = ""
		self.contentTextViewString = ""
		self.qrcImage = NSImage(named: "default")
		self.tabIndex = NSNumber(value: 0)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init()

		// Add Decoding
		self.urlTextFieldString = (aDecoder.decodeObject(forKey: "urlTextFieldString") as? String)!
		self.firstNameTextFieldString = (aDecoder.decodeObject(forKey: "firstNameTextFieldString") as? String)!
		self.lastNameTextFieldString = (aDecoder.decodeObject(forKey: "lastNameTextFieldString") as? String)!
		self.companyTextFieldString = (aDecoder.decodeObject(forKey: "companyTextFieldString") as? String)!
		self.emailHomeTextFieldString = (aDecoder.decodeObject(forKey: "emailHomeTextFieldString") as? String)!
		self.emailWorkTextFieldString = (aDecoder.decodeObject(forKey: "emailWorkTextFieldString") as? String)!
		self.telHomeTextFieldString = (aDecoder.decodeObject(forKey: "telHomeTextFieldString") as? String)!
		self.telWorkTextFieldString = (aDecoder.decodeObject(forKey: "telWorkTextFieldString") as? String)!
		self.faxHomeTextFieldString = (aDecoder.decodeObject(forKey: "faxHomeTextFieldString") as? String)!
		self.faxWorkTextFieldString = (aDecoder.decodeObject(forKey: "faxWorkTextFieldString") as? String)!
		self.streetAddrHomeTextFieldString = (aDecoder.decodeObject(forKey: "streetAddrHomeTextFieldString") as? String)!
		self.cityAddrHomeTextFieldString = (aDecoder.decodeObject(forKey: "cityAddrHomeTextFieldString") as? String)!
		self.stateAddrHomeTextFieldString = (aDecoder.decodeObject(forKey: "stateAddrHomeTextFieldString") as? String)!
		self.zipAddrHomeTextFieldString = (aDecoder.decodeObject(forKey: "zipAddrHomeTextFieldString") as? String)!
		self.countryAddrHomeTextFieldString = (aDecoder.decodeObject(forKey: "countryAddrHomeTextFieldString") as? String)!
		self.streetAddrWorkTextFieldString = (aDecoder.decodeObject(forKey: "streetAddrWorkTextFieldString") as? String)!
		self.cityAddrWorkTextFieldString = (aDecoder.decodeObject(forKey: "cityAddrWorkTextFieldString") as? String)!
		self.stateAddrWorkTextFieldString = (aDecoder.decodeObject(forKey: "stateAddrWorkTextFieldString") as? String)!
		self.zipAddrWorkTextFieldString = (aDecoder.decodeObject(forKey: "zipAddrWorkTextFieldString") as? String)!
		self.countryWorkTextFieldString = (aDecoder.decodeObject(forKey: "countryWorkTextFieldString") as? String)!
		self.urlVCardTextFieldString = (aDecoder.decodeObject(forKey: "urlVCardTextFieldString") as? String)!
		self.telNumberTextFieldString = (aDecoder.decodeObject(forKey: "telNumberTextFieldString") as? String)!
		self.emailAddrTextFieldString = (aDecoder.decodeObject(forKey: "emailAddrTextFieldString") as? String)!
		self.subjectTextFieldString = (aDecoder.decodeObject(forKey: "subjectTextFieldString") as? String)!
		self.contentTextViewString = (aDecoder.decodeObject(forKey: "contentTextViewString") as? String)!
		self.qrcImage = (aDecoder.decodeObject(forKey: "qrcImage") as? NSImage)!
		self.tabIndex = (aDecoder.decodeObject(forKey: "tabIndex") as? NSNumber)!
	}

	func encode(with aCoder: NSCoder) {
		// Add Encoding
		aCoder.encode(self.urlTextFieldString, forKey: "urlTextFieldString")
		aCoder.encode(self.firstNameTextFieldString, forKey: "firstNameTextFieldString")
		aCoder.encode(self.lastNameTextFieldString, forKey: "lastNameTextFieldString")
		aCoder.encode(self.companyTextFieldString, forKey: "companyTextFieldString")
		aCoder.encode(self.emailHomeTextFieldString, forKey: "emailHomeTextFieldString")
		aCoder.encode(self.emailWorkTextFieldString, forKey: "emailWorkTextFieldString")
		aCoder.encode(self.telHomeTextFieldString, forKey: "telHomeTextFieldString")
		aCoder.encode(self.telWorkTextFieldString, forKey: "telWorkTextFieldString")
		aCoder.encode(self.faxHomeTextFieldString, forKey: "faxHomeTextFieldString")
		aCoder.encode(self.faxWorkTextFieldString, forKey: "faxWorkTextFieldString")
		aCoder.encode(self.streetAddrHomeTextFieldString, forKey: "streetAddrHomeTextFieldString")
		aCoder.encode(self.cityAddrHomeTextFieldString, forKey: "cityAddrHomeTextFieldString")
		aCoder.encode(self.stateAddrHomeTextFieldString, forKey: "stateAddrHomeTextFieldString")
		aCoder.encode(self.zipAddrHomeTextFieldString, forKey: "zipAddrHomeTextFieldString")
		aCoder.encode(self.countryAddrHomeTextFieldString, forKey: "countryAddrHomeTextFieldString")
		aCoder.encode(self.streetAddrWorkTextFieldString, forKey: "streetAddrWorkTextFieldString")
		aCoder.encode(self.cityAddrWorkTextFieldString, forKey: "cityAddrWorkTextFieldString")
		aCoder.encode(self.stateAddrWorkTextFieldString, forKey: "stateAddrWorkTextFieldString")
		aCoder.encode(self.zipAddrWorkTextFieldString, forKey: "zipAddrWorkTextFieldString")
		aCoder.encode(self.countryWorkTextFieldString, forKey: "countryWorkTextFieldString")
		aCoder.encode(self.urlVCardTextFieldString, forKey: "urlVCardTextFieldString")
		aCoder.encode(self.telNumberTextFieldString, forKey: "telNumberTextFieldString")
		aCoder.encode(self.emailAddrTextFieldString, forKey: "emailAddrTextFieldString")
		aCoder.encode(self.subjectTextFieldString, forKey: "subjectTextFieldString")
		aCoder.encode(self.contentTextViewString, forKey: "contentTextViewString")
		aCoder.encode(self.qrcImage, forKey: "qrcImage")
		aCoder.encode(self.tabIndex, forKey: "tabIndex")
	}

}
