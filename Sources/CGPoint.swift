//
//  CGPoint.swift
//  X
//
//  Created by Sam Soffes on 5/8/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
	public var stringRepresentation: String {
#if os(OSX)
		return NSStringFromPoint(self)
#else
		return NSCoder.string(for: self)
#endif
	}

	public init(string: String) {
#if os(OSX)
		self = NSPointFromString(string)
#else
		self = NSCoder.cgPoint(for: string)
#endif
	}
}
