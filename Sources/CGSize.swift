//
//  CGSize.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGSize {
	public var stringRepresentation: String {
#if os(OSX)
		return NSStringFromSize(self)
#else
		return NSCoder.string(for: self)
#endif
	}
	
	public init(string: String) {
#if os(OSX)
		self = NSSizeFromString(string)
#else
		self = NSCoder.cgSize(for: string)
#endif
	}

	public var integral: CGSize {
		return CGSize(width: ceil(width), height: ceil(height))
	}

	public func aspectFit(_ boundingSize: CGSize) -> CGSize {
		let aspectRatio = self
		var size = boundingSize
		let widthRatio = boundingSize.width / aspectRatio.width
		let heightRatio = boundingSize.height / aspectRatio.height
		if widthRatio < heightRatio {
			size.height = boundingSize.width / aspectRatio.width * aspectRatio.height
		} else if (heightRatio < widthRatio) {
			size.width = boundingSize.height / aspectRatio.height * aspectRatio.width
		}
		return size
	}

	public func aspectFill(_ minimumSize: CGSize) ->  CGSize {
		let aspectRatio = self
		var size = minimumSize
		let widthRatio = minimumSize.width / aspectRatio.width
		let heightRatio = minimumSize.height / aspectRatio.height
		if widthRatio > heightRatio {
			size.height = minimumSize.width / aspectRatio.width * aspectRatio.height
		} else if heightRatio > widthRatio {
			size.width = minimumSize.height / aspectRatio.height * aspectRatio.width
		}
		return size
	}
}
