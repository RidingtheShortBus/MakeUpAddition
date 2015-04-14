//
//  tbcMain_ViewController.swift
//  MakeupAddiction
//
//  Created by Stephen Shellenberger on 4/10/15.
//  Copyright (c) 2015 Riding the ShortBus. All rights reserved.
//

import Foundation;
import UIKit;

class tbcMain : UITabBarController, UITabBarControllerDelegate
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(animated: Bool)
    {
        //array of the root view controllers displayed by the tab bar interface
        let controllers = [self.getFeed(), self.getDiscover(), self.getAdd(), self.getReviews(), self.getNotifications(), self.getProfile()];
        self.viewControllers = controllers;
    }
    
    //Delegate methods
    func tabBarController(tabBarController: UITabBarController
                        , shouldSelectViewController viewController: UIViewController) -> Bool
    {
        println("should select viewController: \(viewController.title) ?");
        return true;
    }
    
    func getFeed() -> UIPageViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Feed", bundle: nil);
        var pvc:UIPageViewController = storyboard.instantiateViewControllerWithIdentifier("sbidFeed_Entry") as! UIPageViewController;
        return pvc;
    }
    
    func getDiscover() -> UINavigationController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Discover", bundle: nil);
        var nc:UINavigationController = storyboard.instantiateViewControllerWithIdentifier("sbidDiscover_Entry") as! UINavigationController;
        return nc;
    }
    
    func getAdd() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Add", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidAdd_Entry") as! UIViewController;
        return vc;
    }
    
    func getReviews() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Reviews", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidReviews_Entry") as! UIViewController;
        return vc;
    }
    
    func getNotifications() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Notifications", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidNotifications_Entry") as! UIViewController;
        return vc;
    }
    
    func getProfile() -> UIViewController!
    {
        var storyboard:UIStoryboard = UIStoryboard(name: "Profile", bundle: nil);
        var vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("sbidProfile_Entry") as! UIViewController;
        return vc;
    }
}