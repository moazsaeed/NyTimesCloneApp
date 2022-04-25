//
//  UIViewController+StoryboardCreatable.swift
//  NyTimesNewsAssignment
//
//  Created by Moaz Saeed (c) on 24/04/2022.
//

import UIKit

protocol StoryboardCreatable: class {
    static var storyboard: UIStoryboard { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String { get }
    static var storyboardName: String { get }
    
    static func instanceFromStoryboard() -> Self
}
