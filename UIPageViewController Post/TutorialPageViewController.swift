//
//  TutorialPageViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 12/11/15.
//  Copyright © 2015 Atomic Object. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be showin in this order
        return [self.newColoredViewController("Green"),
                self.newColoredViewController("Red"),
                self.newColoredViewController("Blue")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = self.orderedViewControllers.first {
            self.setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
    }
    
    func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(color)ViewController")
    }
    
    // MARK: UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var previousViewController: UIViewController?
        
        guard let viewControllerIndex = self.orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        if self.orderedViewControllers.count > previousIndex && previousIndex >= 0 {
            previousViewController = self.orderedViewControllers[previousIndex]
        }
            // User is on the first view controller and swiped left -> loop to the end
        else if previousIndex < 0 {
            previousViewController = self.orderedViewControllers.last
        }
        
        return previousViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var nextViewController: UIViewController?
        
        guard let viewControllerIndex = self.orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        if self.orderedViewControllers.count > nextIndex {
            nextViewController = self.orderedViewControllers[nextIndex]
        }
            // User is on the last view controller and swiped right -> loop to the beginning
        else if self.orderedViewControllers.count == nextIndex {
            nextViewController = self.orderedViewControllers.first
        }
        
        return nextViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.indexOf(self.viewControllers!.first!)!
    }
    
}
