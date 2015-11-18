//
//  TweakLibrary.swift
//  SwiftTweaks
//
//  Created by Bryan Clark on 11/6/15.
//  Copyright © 2015 Khan Academy. All rights reserved.
//

import Foundation

/// Create a public struct in your application that conforms to this protocol to declare your own tweaks!
public protocol TweakLibraryType {
	static var defaultStore: TweakStore { get }
}

public extension TweakLibraryType {
	/// Returns the current value for a tweak from the TweakLibrary's default store.
	static func assign<T>(tweak: Tweak<T>) -> T {
		return self.defaultStore.currentValueForTweak(tweak)
	}

	/// Immediately binds the currentValue of a given tweak, and then continues to update whenever the tweak changes.
	static func bind<T>(tweak: Tweak<T>, binding: (T) -> Void) {
		self.defaultStore.bind(tweak, binding: binding)
	}

	/// Similar to `bind`, but for multiple tweaks.
	//  Accepts a set of Tweaks, and immediately calls the updateHandler.
	/// The updateHandler is then re-called each time any of the Set's tweaks change.
	/// Inside the updateHandler, you'll need to use `assign` to get the tweaks' current values.
	static func bindTweakSet(tweaks: Set<AnyTweak>, binding: () -> Void) {
		self.defaultStore.bindTweakSet(tweaks, binding: binding)
	}
}