//
//  CGRect.swift
//  X
//
//  Created by Sam Soffes on 4/28/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect {
	public var stringRepresentation: String {
#if os(OSX)
		return NSStringFromRect(self)
#else
		return NSCoder.string(for: self)
#endif
	}
	
	public init(string: String) {
#if os(OSX)
		self = NSRectFromString(string)
#else
		self = NSCoder.cgRect(for: string)
#endif
	}

	public func aspectFit(_ boundingRect: CGRect) -> CGRect {
		let size = self.size.aspectFit(boundingRect.size)
		var origin = boundingRect.origin
		origin.x += (boundingRect.size.width - size.width) / 2.0
		origin.y += (boundingRect.size.height - size.height) / 2.0
		return CGRect(origin: origin, size: size)
	}

	func aspectFill(_ minimumRect: CGRect) -> CGRect {
		let size = self.size.aspectFill(minimumRect.size)
		return CGRect(
			x: (minimumRect.size.width - size.width) / 2.0,
			y: (minimumRect.size.height - size.height) / 2.0,
			width: size.width,
			height: size.height
		)
	}

	public func apply(contentMode: ContentMode, bounds: CGRect) -> CGRect {
		var rect = self
		switch contentMode {
		case .scaleToFill:
			return bounds
		case .scaleAspectFit:
			return aspectFit(bounds)
		case .scaleAspectFill:
			return aspectFill(bounds)
		case .redraw:
			return rect
		case .center:
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .top:
			rect.origin.y = 0
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			return rect
		case .bottom:
			rect.origin.x = (bounds.size.width - rect.size.width) / 2.0
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		case .left:
			rect.origin.x = 0
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .right:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = (bounds.size.height - rect.size.height) / 2.0
			return rect
		case .topLeft:
			rect.origin = CGPoint.zero
			return rect
		case .topRight:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = 0
			return rect
		case .bottomLeft:
			rect.origin.x = 0
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		case .bottomRight:
			rect.origin.x = bounds.size.width - rect.size.width
			rect.origin.y = bounds.size.height - rect.size.height
			return rect
		@unknown default:
			return bounds
		}
	}
}
