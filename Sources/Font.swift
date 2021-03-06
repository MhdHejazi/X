//
//  Font.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

#if os(OSX)
	import AppKit.NSFont
	public typealias Font = NSFont
#else
	import UIKit.UIFont
	public typealias Font = UIFont
#endif


extension Font {
	public var fontWithMonospacedNumbers: Font {
		#if os(OSX)
			let fontDescriptor = self.fontDescriptor.addingAttributes([
				NSFontDescriptor.AttributeName.featureSettings: [
					[
						NSFontDescriptor.FeatureKey.typeIdentifier: kNumberSpacingType,
						NSFontDescriptor.FeatureKey.selectorIdentifier: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize) ?? self
		#elseif os(watchOS)
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptorFeatureSettingsAttribute: [
					[
						UIFontFeatureTypeIdentifierKey: 6,
						UIFontFeatureSelectorIdentifierKey: 0
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#else
			let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize).addingAttributes([
				UIFontDescriptor.AttributeName.featureSettings: [
					[
						UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
						UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
					]
				]
			])
			return Font(descriptor: fontDescriptor, size: pointSize)
		#endif
	}
}
