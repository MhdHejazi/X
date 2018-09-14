//
//  CGPoint.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(OSX)
	public func NSStringFromCGPoint(_ point: CGPoint) -> String! {
		return NSStringFromPoint(point)
	}

	public func CGPointFromString(_ string: String!) -> CGPoint {
		return NSPointFromString(string) as CGPoint
	}
#else
	import UIKit
#endif


extension CGPoint {
	public var stringRepresentation: String {
		return NSCoder.string(for: self)
	}

	public init(string: String) {
		self = NSCoder.cgPoint(for: string)
	}
}
