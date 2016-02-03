//
//  TutorialViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tutorialPageViewController = segue.destinationViewController as? TutorialPageViewController {
            tutorialPageViewController.tutorialDelegate = self
        }
    }

}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
