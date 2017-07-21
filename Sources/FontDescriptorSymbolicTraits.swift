//
//  FontDescriptorSymbolicTraits.swift
//  X
//
//  Created by Sam Soffes on 8/26/16.
//  Copyright © 2016 Sam Soffes. All rights reserved.
//

import Foundation

#if os(OSX)
	import AppKit
	public typealias FontDescriptorSymbolicTraits = NSFontDescriptor.SymbolicTraits
#else
	import UIKit
	public typealias FontDescriptorSymbolicTraits = UIFontDescriptorSymbolicTraits
#endif
